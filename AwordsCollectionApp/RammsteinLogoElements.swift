//
//  RammsteinLogo.swift
//  AwordsCollectionApp
//
//  Created by Сергей on 26.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct LogoRammsteinElements: View {
    let size: CGFloat
    
    var showElementOne = false
    var showElementTwo = false
    var showElementThree = false
    var showElementFour = false
    var showElementR = false
    
    var body: some View {
        GeometryReader { geometry in
//            let size = min(geometry.size.height, geometry.size.width)
            let minIndent = size * 0.056
            let longLine = size / 2 - minIndent / 2
            let shortLine = longLine / 2
            
            Path { path in
                if showElementOne {
                    path.move(to: CGPoint(x: shortLine, y: shortLine - minIndent))
                    path.addLine(to: CGPoint(x: shortLine, y: 0))
                    path.addLine(to: CGPoint(x: longLine, y: 0))
                }
                
                if showElementTwo {
                    path.move(to: CGPoint(x: longLine + minIndent, y: 0))
                    path.addLine(to: CGPoint(x: size - shortLine, y: 0))
                    path.addLine(to: CGPoint(x: size - shortLine, y: shortLine))
                    path.addLine(to: CGPoint(x: size, y: shortLine))
                    path.addLine(to: CGPoint(x: size, y: longLine))
                }
                
                if showElementThree {
                    path.move(to: CGPoint(x: size, y: size - longLine))
                    path.addLine(to: CGPoint(x: size, y: size - shortLine))
                    path.addLine(to: CGPoint(x: size - shortLine, y: size - shortLine))
                    path.addLine(to: CGPoint(x: size - shortLine, y: size))
                    path.addLine(to: CGPoint(x: size - longLine, y: size))
                }
                
                if showElementFour {
                    path.move(to: CGPoint(x: longLine, y: size))
                    path.addLine(to: CGPoint(x: shortLine, y: size))
                    path.addLine(to: CGPoint(x: shortLine, y: size - (shortLine - minIndent) ))
                }
                if showElementR {
                    path.move(to: CGPoint(x: 0, y: longLine))
                    path.addLine(to: CGPoint(x: 0, y: shortLine))
                    path.addLine(to: CGPoint(x: longLine + minIndent, y: shortLine))
                    path.addLine(to: CGPoint(x: longLine + minIndent, y: longLine + minIndent))
                    path.addLine(to: CGPoint(x: shortLine * 2 + minIndent * 2.5, y: longLine + minIndent + shortLine))
                    path.addLine(to: CGPoint(x: shortLine + (minIndent * 2), y: longLine + minIndent + shortLine))
                    path.addLine(to: CGPoint(x: shortLine + (minIndent * 0.5), y: longLine + minIndent))
                    path.addLine(to: CGPoint(x: shortLine, y: longLine + minIndent))
                    path.addLine(to: CGPoint(x: shortLine, y: size - shortLine))
                    path.addLine(to: CGPoint(x: 0, y: size - shortLine))
                    path.addLine(to: CGPoint(x: 0, y: size - longLine))
                }
            }
            .stroke(
                Color.primary,
                style: StrokeStyle(lineWidth: size * 0.05)
            )
            .shadow(radius: size * 0.08)
            
        }
        .frame(width: size, height: size)
        .padding()
        
    }
}


struct LogoElementR_Previews: PreviewProvider {
    static var previews: some View {
        LogoRammsteinElements(size: 300,
                              showElementOne: true,
                              showElementTwo: true,
                              showElementThree: true,
                              showElementFour: true,
                              showElementR: true)
    }
}
