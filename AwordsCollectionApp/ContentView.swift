//
//  ContentView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape = false
    
    var body: some View {
        VStack {
            Button(action: { withAnimation { showShape.toggle() }}) {
                HStack {
                    Text(showShape ? "Hide Shape" : "Show Shape")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showShape ? 2 : 1)
                        .rotationEffect(.degrees(showShape ? 0 : 180))
                }
            }
            
            Spacer()
            
            ZStack {
                let size: CGFloat = 250
                if showShape {
                    Group {
                        LogoRammsteinElements(size: size, showElementR: true)
                            .transition(.move(edge: .leading))
                        
                        LogoRammsteinElements(size: size, showElementOne: true)
                            .transition(.upperLeft)
                        LogoRammsteinElements(size: size, showElementTwo: true)
                            .transition(.upperRight)
                        LogoRammsteinElements(size: size, showElementThree: true)
                            .transition(.bottomRight)
                        LogoRammsteinElements(size: size, showElementFour: true)
                            .transition(.bottomLeft)

                    }
                    .animation(.default)
                }
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .move(edge: .top))
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
        
    }
    
    static var upperLeft = AnyTransition.move(edge: .leading).combined(with: .move(edge: .top))
    
    static var upperRight = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .top))
    
    static var bottomLeft = AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom))
    
    static var bottomRight = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom))
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
