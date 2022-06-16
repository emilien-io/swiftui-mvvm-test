//
//  Mirror.swift
//  swiftui-test
//
//  Created by emilien on 15/06/2022.
//

import SwiftUI

struct Mirror: View {
    var value: String
    
    var body: some View {
        Text(value)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.caption)
            .multilineTextAlignment(.center)
            .background(.black.opacity(0.05))
            .cornerRadius(20)
            .padding()
    }
}

struct Mirror_Previews: PreviewProvider {
    static var previews: some View {
        Mirror(value: "This is an example.")
    }
}
