//
//  GuideComponentt.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 15/03/24.
//

import SwiftUI

struct GuideComponentt: View {
    // MARK: - PROPERTIES
    var title : String
    var subtitle : String
    var description : String
    var icon : String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 20) {
            
            Image(systemName : icon)
                .font(.largeTitle)
                .foregroundStyle(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(alignment: .center, spacing: 10, content: {
                    
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .foregroundStyle(.pink)
                })
                Divider()
                    .padding(.bottom,4)

                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    GuideComponentt(title: "Title", subtitle: "Swipe Right", description: "This is a placeholder. This is a placeholder. This is a placeholder. This is a placeholder.", icon: "heart.circle")
}
