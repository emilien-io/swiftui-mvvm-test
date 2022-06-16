# Text mirroring in SwiftUI using MVVM pattern

(Xcode 13.4.1)

In this project we use SwiftUI properties wrappers to reflect a textfield's value in a separated view using a basic MVVM design pattern.

# Properties wrappers

> State is inevitable in any modern app, but with SwiftUI it’s important to remember that all of our views are simply functions of their state – we don’t change the views directly, but instead manipulate the state and let _that_ dictate the result.
*(Paul Husdon, on [hackingwithswift](https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject)*

Properties wrappers are one of the biggest features of SwiftUI. Some of them allows you to manage the state of your application.

- `@Observed  private  var  viewModel` in `Content.swift`
	> We create the `viewModel` with an `@ObservedObject` wrapper so that the view gets notified on `@Published` property update.
	
- `@Published var value: String` in `Content.swift` extension
	> The @Published keyword tells to SwiftUI we want to notify every views that observe this property.

- `@State private var value: String` in `Card.swift`
	>  @State allow us to modify values inside a struct. We move the storage to a shared storage managed by SwiftUI. This way the property can be destroyed, re-created but it will always keep the state we gave it before so that it can reflect it new state.
	
	> Note: Apple recommends to add the `private` keyword to re-enforce the local nature of `@State` properties.

In addition, the `Card` view as a `onEdit((String) -> Void)` callback that is call every time `value` is updated from the textfield. 

```
TextField("Try to type something here!", text: $value)
	.onChange(of: value) { _ in
	   onEdit(value)
	}
```

This notify `Content` view that the textfield value has been updated and it should reflect it in the `Mirror` view that will be reloaded.

```
Card { newValue in
	viewModel.entry = newValue
}
```

Since the `Content` view watch for update of `entry` in its view model, each time it is updated, the view is reloaded, giving the `Mirror` view automatically the latest value.

# Conclusion

In this project, we saw how we should use MVVM model with SwiftUI. Obviously we could have done it way easier [using only SwiftUI wrappers](https://github.com/emilien-io/swiftui-test), but it shows how modulable SwiftUI is and it gave us the possibility to chose the best approach based on the task we are trying to accomplish.

# Few references

- https://www.swiftbysundell.com/articles/property-wrappers-in-swift/
- https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject
- https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-observedobject-property-wrapper
- https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-published-property-wrapper
- https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-state-property-wrapper
- https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-stateobject-property-wrapper
- https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-environmentobject-property-wrapper
