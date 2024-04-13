//
//  FooterView.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 14/03/24.
//

import SwiftUI

struct FooterView: View {
    @Binding var showAlert : Bool
    var body: some View {
        
        HStack {
            Button {
                
            } label: {
                
                Image(systemName: "xmark.circle")
                    .font(.system(size: 42,weight: .light))
            }
            Spacer()
            
            Button {
                showAlert = true
            } label: {
                
                Text("book Destination".uppercased())
                    .font(.title3)
                    .fontWeight(.heavy)
                    .fontDesign(.rounded)
                    .padding(.horizontal,16)
                    .padding(.vertical,5)
                    .foregroundStyle(.pink)
                    .background(
                        Capsule()
                            .stroke(lineWidth: 2)
                            .fill(.pink)
                    )
            }

            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "heart.circle")
                    .font(.system(size: 42,weight: .light))
            }

        }
        .padding()
    }
}

//#Preview {
//    FooterView()
//}
