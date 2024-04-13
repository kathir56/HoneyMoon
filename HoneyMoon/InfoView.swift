//
//  InfoView.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 15/03/24.
//

import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    // MARK: - BODY
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credtis")
                    .modifier(TitleModifier())
                
                CredtisView()
                
                Spacer(minLength: 10)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                
                })
                
                
            }// Vstack
            .padding(.top,15)
            .padding(.bottom,25)
            .padding(.horizontal,25)
        }
        
    }
}

#Preview {
    InfoView()
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment : .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "HoneyMoon")
            RowAppInfoView(itemOne: "Compatability", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Kathiravan")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.1.0")
        }
    }
}

struct RowAppInfoView: View {
    var itemOne : String
    var itemTwo : String
    var body: some View {
        VStack
        {
            HStack
            {
                Text(itemOne)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CredtisView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            HStack
            {
                Text("Photos")
                    .foregroundStyle(.secondary)
                Spacer()
                
                Text("Unplash")
                
            }
            Divider()
            
            Text("Photograhpers")
                .foregroundStyle(.secondary)
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}
