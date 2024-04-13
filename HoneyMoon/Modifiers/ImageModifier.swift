//
//  ImageModifier.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 16/03/24.
//

import SwiftUI

struct ImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(size: 128))
            .shadow(color: .black.opacity(0.3), radius: 10)
        
    }
}

