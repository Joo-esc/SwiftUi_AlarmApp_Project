//
//  MemorizeGameScreen에서 사용되는 Modifier
//  선택 여뷰에 따라 카드의 앞뒤 면을 보여줌
//
//  Created by 이해주 on 2022/01/11.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isSelected: Bool
    let shape = RoundedRectangle(cornerRadius: 12)
    func body(content: Content) -> some View {
            if isSelected {
                EmptyView().roundRectify(12, .center, .lightPurple)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.white).cornerRadius(12)
                content
            }
            else {
                EmptyView().roundRectify(12, .center)
            }
        }
}

extension View {
    func cardify(isSelected: Bool) -> some View {
        modifier(Cardify(isSelected: isSelected))
    }
}

