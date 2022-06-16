//
//  Content.swift
//  swiftui-test
//
//  Created by emilien on 15/06/2022.
//

import SwiftUI

struct Content: View {
    @ObservedObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Card { newValue in
                viewModel.entry = newValue
            }
            
            Mirror(value: viewModel.entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

extension Content {
    @MainActor class ContentViewModel: ObservableObject {
        @Published var entry: String = ""
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
