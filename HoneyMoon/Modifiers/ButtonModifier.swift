//
//  ButtonModifier.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 15/03/24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.medium)
            .padding()
            .foregroundStyle(.white)
            .frame(minWidth: 0,maxWidth: .infinity)
            .background(
                Capsule()
                    .fill(.pink)
            )
    }
}

