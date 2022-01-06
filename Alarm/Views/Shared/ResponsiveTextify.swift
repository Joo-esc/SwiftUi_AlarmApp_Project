// 반응형 텍스트 Modifider

import SwiftUI

struct ResponsiveTextify: ViewModifier {
    let fontSize: CGFloat
    let fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
            content
            .font(.system(size: fontSize, weight: fontWeight, design: .default))
                .minimumScaleFactor(0.0001)
                .lineLimit(1)
                .foregroundColor(.white)
    }
}

extension View {
    func responsiveTextify(fontSize: CGFloat, fontWeight: Font.Weight) -> some View {
        modifier(ResponsiveTextify(fontSize: fontSize, fontWeight: fontWeight))
    }
}

