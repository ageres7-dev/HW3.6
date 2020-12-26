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
                
                if !showShape {
                    ScrollView {
                        Text("Rammstein \n \n немецкая метал-группа, образованная в январе 1994 года в Берлине. Музыкальный стиль группы относится к жанру индастриал-метала (конкретно — его немецкой сцене Neue Deutsche Härte). Основные черты творчества группы: специфический ритм, в котором выдержана большая часть композиций, и эпатирующие тексты песен. Особую известность группе принесли сценические выступления, часто сопровождаемые использованием пиротехники, получившие признание в музыкальной среде. Состав группы ни разу не менялся.")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            
                            
                    }
                    .transition(.scale(scale: 0))
                }
                
                AnamatedLogo(showShape: showShape)
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


struct AnamatedLogo: View {
    let showShape: Bool
    
    var body: some View {
        
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
            .animation(.easeInOut)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
