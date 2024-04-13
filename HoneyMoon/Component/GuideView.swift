//
//  GuideView.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 15/03/24.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment:.leading,spacing: 25,content: {
                    
                    GuideComponentt(title: "Like", subtitle: "Swipe right", description: "Do you like the destination? Touch the screen and swipe right. It will add to your favourites", icon: "heart.circle")
                    
                    GuideComponentt(title: "Dimiss", subtitle: "Swipe Left", description: "Would you rather skip the place? Touch the screen and swipe left. You will no longer see it.", icon: "xmark.circle")
                    
                    GuideComponentt(title: "Book", subtitle: "Tap the button", description: "Our selection of honeymoon resort is perfect setting for you to embark your life together.", icon: "checkmark.square")
                    

                })
                
                Spacer(minLength: 10)
                
                Button {
                    dismiss()
                } label: {
                    
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                        
                }

                
            }// Vstack
            .padding(.bottom,25)
            .padding(.top,15)
            .padding(.horizontal,25)
        }
    }
}

#Preview {
    GuideView()
}
