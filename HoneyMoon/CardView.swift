//
//  CardView.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 14/03/24.
//

import SwiftUI

struct CardView: View,Identifiable {
    var id = UUID()
    var honeyMoon : Destination
    var body: some View {
        
        Image(honeyMoon.image)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .scaledToFit()
            .frame(minWidth: 0,maxWidth: .infinity)
            .overlay {
                VStack(alignment: .center, spacing: 12) {
                    
                    Spacer()
                    
                    Text(honeyMoon.place.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(.horizontal,18)
                        .lineLimit(2)
                        .padding(.vertical,4)
                        .overlay {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 1)
                                .offset( y: 26)
                        }
                    
                    Text(honeyMoon.country.uppercased())
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.white)
                        }
                }
                .frame(minWidth: 280,maxWidth: .infinity)
                .padding(.bottom,50)
            }
    }
}

#Preview {
    CardView(honeyMoon: honeyMoonData[4])
}
