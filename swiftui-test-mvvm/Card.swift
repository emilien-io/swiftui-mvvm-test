//
//  Card.swift
//  swiftui-test
//
//  Created by emilien on 15/06/2022.
//

import SwiftUI

struct Card: View {
    @State private var value: String = ""
    let onEdit: ((String) -> Void)

    var body: some View {
        VStack {
            Text("Two way binding (MVVM) example".uppercased())
                .bold()
                .padding()
            TextField("Try to type something here!", text: $value)
                .font(.caption)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .onChange(of: value) { _ in
                    onEdit(value)
                }
        }
        .background(.black.opacity(0.05))
        .cornerRadius(20)
        .padding()
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(onEdit: {_ in })
    }
}
