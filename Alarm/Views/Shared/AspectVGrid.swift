//
//  MemorizeGameScreen에서 사용되는 그리드 레이아웃 뷰
//  기기 사이즈에 따라 반응형으로 대응.
//  Created by 이해주 on 2022/01/09.
//

import SwiftUI

struct AspectVGrid <ItemView>: View where ItemView: View {
    let aspectRatio: CGFloat
    let cardSize: CGFloat
    var items : [Memorize.Card]
    var content : (Memorize.Card) -> ItemView

   
    init(_ aspectRatio: CGFloat, _ cardSize: CGFloat, _ items: [Memorize.Card], @ViewBuilder _ content: @escaping (Memorize.Card) -> ItemView) {
        self.aspectRatio = aspectRatio
        self.cardSize = cardSize
        self.items = items
        self.content = content
    }
   
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: cardSize))]) {
            ForEach(items) { item in
                content(item)
                    .aspectRatio(aspectRatio, contentMode: .fit)
              }
        }
    }
}

