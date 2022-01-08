// 반응형 텍스트 Modifider

import SwiftUI

struct ResponsiveTextify: ViewModifier {
    let fontSize: CGFloat
    let fontWeight: Font.Weight
    
    init(_ fontSize: CGFloat, _ fontWeight: Font.Weight) {
        self.fontSize = fontSize
        self.fontWeight = fontWeight
    }
    
    func body(content: Content) -> some View {
            content
            .font(.system(size: fontSize, weight: fontWeight, design: .default))
                .minimumScaleFactor(0.0001)
                .lineLimit(1)
                .foregroundColor(.white)
    }
}

extension View {
    func responsiveTextify(_ fontSize: CGFloat, _ fontWeight: Font.Weight) -> some View {
        modifier(ResponsiveTextify(fontSize, fontWeight))
    }
}

