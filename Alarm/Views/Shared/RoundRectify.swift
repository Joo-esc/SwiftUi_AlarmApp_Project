//
//  RoundRectify.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct RoundRectify: ViewModifier {
    let cornerRadius: CGFloat
//    let shape = RoundedRectangle(cornerRadius: cornerRadius)
    func body(content: Content) -> some View {
        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: cornerRadius)
                .shadow(color: .black.opacity(0.25), radius: 5)
            content
        }
        .foregroundColor(.lightDark)
    }
}
extension View {
    func roundRectify(conrerRadius: CGFloat) -> some View {
        modifier(RoundRectify(cornerRadius: conrerRadius))
    }
}





