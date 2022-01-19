//
//  RoundRectify.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct RoundRectify: ViewModifier {
    let cornerRadius: CGFloat
    let alignment: Alignment
    let backgroundColor: Color
    
    init(_ cornerRadius: CGFloat, _ alignment: Alignment, _ backgroundColor: Color) {
        self.cornerRadius = cornerRadius
        self.alignment = alignment
        self.backgroundColor = backgroundColor
        
    }
    
    func body(content: Content) -> some View {
        ZStack (alignment: alignment) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .shadow(color: .black.opacity(0.25), radius: 5)
            content
        }
        .foregroundColor(backgroundColor)
    }
}
extension View {
    func roundRectify(_ conrerRadius: CGFloat, _ alignment: Alignment, _ backgroundColor: Color = .lightDark) -> some View {
        modifier(RoundRectify(conrerRadius, alignment, backgroundColor))
    }
}





