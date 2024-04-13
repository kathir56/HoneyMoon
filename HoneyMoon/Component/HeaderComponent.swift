//
//  HeaderComponent.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 15/03/24.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 20, content: {
            
            Capsule()
                .frame(width: 128,height: 6)
                .foregroundStyle(.secondary)
                .opacity(0.2)
            
            Image(.logoHoneymoon)
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        })
        
    }
}

#Preview {
    HeaderComponent()
}
