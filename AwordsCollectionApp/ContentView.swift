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
                HearImage(showShape: !showShape)
                
                AnamatedLogo(showShape: showShape)
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
}

struct HearImage: View {
    let showShape: Bool
    var body: some View {
        if showShape {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .shadow(radius: 20)
                .foregroundColor(.red)
                .transition(.scale(scale: 0))
                .frame(width: sizeElement, height: sizeElement)
        }
    }
}

struct AnamatedLogo: View {
    let showShape: Bool
    
    var body: some View {
        let size = sizeElement
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
            .animation(.easeInOut)
        }
    }
}

extension AnyTransition {
    static var upperLeft = AnyTransition.move(edge: .leading).combined(with: .move(edge: .top))
    static var upperRight = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .top))
    static var bottomLeft = AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom))
    static var bottomRight = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom))
}

extension View {
    var sizeElement: CGFloat { UIScreen.main.bounds.width * 0.75 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HearImage_Previews: PreviewProvider {
    static var previews: some View {
        HearImage(showShape: true)
    }
}

struct AnamatedLogo_Previews: PreviewProvider {
    static var previews: some View {
        AnamatedLogo(showShape: true)
    }
}

/*
static var upperLeft: AnyTransition {
    let insertion = AnyTransition.move(edge: .leading).combined(with: .move(edge: .top))
    let removal = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom))
    return .asymmetric(insertion: insertion, removal: removal)
}

static var upperRight: AnyTransition {
    let insertion = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .top))
    let removal = AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom))
    return .asymmetric(insertion: insertion, removal: removal)
}

static var bottomLeft: AnyTransition {
    let insertion = AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom))
    let removal = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .top))
    return .asymmetric(insertion: insertion, removal: removal)
}
static var bottomRight: AnyTransition {
    
    let insertion = AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom))
    let removal = AnyTransition.move(edge: .leading).combined(with: .move(edge: .top))
    return .asymmetric(insertion: insertion, removal: removal)
}
*/
