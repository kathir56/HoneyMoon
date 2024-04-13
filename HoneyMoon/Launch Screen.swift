//
//  Launch Screen.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 14/03/24.
//

import SwiftUI

struct Launch_Screen: View {
    var body: some View {
        
        ZStack
        {
            Image(.backgound)
                .resizable()
                .renderingMode(.original)
                .ignoresSafeArea(edges: .all)
            
            Image(.logoHoneymoonApp)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 300)
        }
    }
}

#Preview {
    Launch_Screen()
}
