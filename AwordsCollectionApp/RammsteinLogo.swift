//
//  RammsteinLogo.swift
//  AwordsCollectionApp
//
//  Created by Сергей on 26.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RammsteinLogo: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.height, geometry.size.width)
            
//            let cornerIndent = size * 0.26
            let minIndent = size * 0.056
            let longLine = size / 2 - minIndent / 2
            let shortLine = longLine / 2
            
            Path { path in
                
                path.move(to: CGPoint(x: shortLine, y: shortLine - minIndent))
                path.addLine(to: CGPoint(x: shortLine, y: 0))
                path.addLine(to: CGPoint(x: longLine, y: 0))
                
                //
                path.move(to: CGPoint(x: longLine + minIndent, y: 0))
                path.addLine(to: CGPoint(x: size - shortLine, y: 0))
                path.addLine(to: CGPoint(x: size - shortLine, y: shortLine))
                path.addLine(to: CGPoint(x: size, y: shortLine))
                path.addLine(to: CGPoint(x: size, y: longLine))
                
                //
                path.move(to: CGPoint(x: size, y: size - longLine))
                path.addLine(to: CGPoint(x: size, y: size - shortLine))
                path.addLine(to: CGPoint(x: size - shortLine, y: size - shortLine))
                path.addLine(to: CGPoint(x: size - shortLine, y: size))
                path.addLine(to: CGPoint(x: size - longLine, y: size))
                
                //
                path.move(to: CGPoint(x: longLine, y: size))
                path.addLine(to: CGPoint(x: shortLine, y: size))
                path.addLine(to: CGPoint(x: shortLine, y: size - (shortLine - minIndent) ))
                
                //Character R
                path.move(to: CGPoint(x: 0, y: longLine))
                path.addLine(to: CGPoint(x: 0, y: shortLine))
                path.addLine(to: CGPoint(x: longLine + (minIndent * 1.5), y: shortLine))
                path.addLine(to: CGPoint(x: longLine + (minIndent * 1.5), y: longLine + minIndent))
                path.addLine(to: CGPoint(x: longLine + (minIndent * 1.5) + minIndent, y: longLine + minIndent + shortLine))
                
                
//                path.addLine(to: CGPoint(x: size - (shortLine + minIndent * 2), y: longLine + minIndent + shortLine))
                path.addLine(to: CGPoint(x: size - (longLine + minIndent * 2), y: longLine + minIndent + shortLine))
                path.addLine(to: CGPoint(x: shortLine + (minIndent * 1.5), y: longLine + minIndent))
                
                path.addLine(to: CGPoint(x: shortLine, y: longLine + minIndent))
                path.addLine(to: CGPoint(x: shortLine, y: size - shortLine))
                path.addLine(to: CGPoint(x: 0, y: size - shortLine))
                path.addLine(to: CGPoint(x: 0, y: size - longLine))
               
            }
            .stroke(
                Color.black,
                style: StrokeStyle(lineWidth: 10)
            )
            
        }
        .padding()
        .frame(width: width, height: height)
            
    
    }
}


//struct RammsteinStroke: ViewModifier {
//    func body(content: Content) -> some View {
//        content.stroke
//
//    }
//}


struct RammsteinLogo_Previews: PreviewProvider {
    static var previews: some View {
        RammsteinLogo(width: 300, height: 300)
    }
}
