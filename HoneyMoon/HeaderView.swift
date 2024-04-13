//
//  HeaderView.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 14/03/24.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showGuide : Bool
    @Binding var showCreditsView : Bool
    var body: some View {
        HStack {
            
            Button {
                showCreditsView = true
            } label: {
                
                Image(systemName: "info.circle")
                    .font(.system(size: 24,weight: .regular))
            }

            Spacer()
            
            Image(.logoHoneymoonPink)
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                showGuide = true
            } label: {
                
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24,weight: .regular))
            }

        }
        .sheet(isPresented: $showCreditsView, content: {
            InfoView()
        })
        .padding()
    }
}

//#Preview {
//    HeaderView()
//}
