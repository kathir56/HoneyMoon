//
//  ContentView.swift
//  HoneyMoon
//
//  Created by Kathiravan Murali on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert : Bool = false
    @State private var showGuide : Bool = false
    @State private var showCredit : Bool = false
    @GestureState private var dragState = Dragstate.inActive
    private var dragAreaThreshold : CGFloat = 65.0
    @State private var lastCardIndex : Int = 1
    @State private var cardIndexRemoval : AnyTransition = AnyTransition.trailingBottom
    
    @State var cardViews : [CardView] = {
        var views = [CardView]()
        for index in 0..<2
        {
            views.append(CardView(honeyMoon: honeyMoonData[index]))
        }
        return views
    }()
    
    // MARK: - TOP CARD
    private func topCard(cardView : CardView) -> Bool
    {
        guard let index = cardViews.firstIndex(where: {$0.id == cardView.id}) else {return false}
        return index == 0
    }
    
    // MARK: - MOVE CARDS
    func moveCards()
    {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        let honeyMoonData = honeyMoonData[lastCardIndex%honeyMoonData.count]
        
        cardViews.append(CardView(honeyMoon: honeyMoonData))
    }
    
    // MARK: - DRAG STATES
    
    enum Dragstate
    {
        case inActive
        case pressing
        case draging(transilation : CGSize)
        
        var transilation : CGSize
        {
            switch self
            {
            case .inActive,.pressing:
                return .zero
            case .draging(transilation: let transilation):
                return transilation
            }
            
        }
        
        var isDragging : Bool
        {
            switch self
            {
            case .draging:
                return true
                
            case .pressing,.inActive:
                return false
            }
        }
        
        var isPressing : Bool
        {
            switch self
            {
            case.draging,.pressing:
                return true
            case .inActive:
                return false
            }
        }
    }
    
    var body: some View {
        VStack {
            
            // MARK: -  HEADER VIEW
            HeaderView(showGuide: $showGuide, showCreditsView: $showCredit)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            
            // MARK: - CARD VIEW
            ZStack
            {
                ForEach(cardViews){ cardView in
                    
                    cardView
                        .zIndex(topCard(cardView: cardView) ? 1 : 0)
                        .overlay(content: {
                            ZStack(content: {
                                
                                Image(systemName: "xmark.circle")
                                    .modifier(ImageModifier())
                                    .opacity(self.dragState.transilation.width < -self.dragAreaThreshold && self.topCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(ImageModifier())
                                    .opacity(self.dragState.transilation.width > self.dragAreaThreshold && self.topCard(cardView: cardView) ? 1.0 : 0.0)
                            })
                        })
                        .offset(x: self.topCard(cardView: cardView) ? self.dragState.transilation.width : 0, y: self.topCard(cardView: cardView) ? self.dragState.transilation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.topCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.topCard(cardView: cardView) ? Double(self.dragState.transilation.width/12) : 0))
                        .animation(.interpolatingSpring)
                        .gesture(LongPressGesture(minimumDuration: 0.1)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState,body:{(value,state,transaction) in
                                
                                switch value
                                {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .draging(transilation: drag?.translation ?? .zero)
                                    
                                default:
                                    break
                                }
                                
                            })
                                .onChanged({value in
                                    guard case .second(true, let drag?) = value else{return}
                                    if drag.translation.width < -self.dragAreaThreshold
                                    {
                                        self.cardIndexRemoval = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragAreaThreshold
                                    {
                                        self.cardIndexRemoval = .trailingBottom
                                    }
                                    
                                })
                                .onEnded({value in
                                    guard case .second(true, let drag?) = value else{return}
                                 
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold
                                    {
                                        self.moveCards()
                                    }
                                    
                                })
                        )
                        .transition(self.cardIndexRemoval)
                    
                    
                }
            }
            .padding()
            
            Spacer()
            
            // MARK: - FOOTER VIEW
            FooterView(showAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .sheet(isPresented: $showGuide, content: {
            GuideView()
        })
        .alert(isPresented: $showAlert) {
            
            Alert(title: Text("Success".uppercased()), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy HoneyMoon!")))
        }
        
    }
}

#Preview {
    ContentView()
}
