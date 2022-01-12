//
//  MemorizeGameScreen에서 사용되는 그리드 레이아웃 뷰
//  기기 사이즈에 따라 반응형으로 대응.
//  Created by 이해주 on 2022/01/09.
//

import SwiftUI

struct AspectVGrid <ItemView>: View where ItemView: View {
    let aspectRatio: CGFloat
    var items : [Memorize.Card]
    var content : (Memorize.Card) -> ItemView
    
    
    init(_ aspectRatio: CGFloat,  _ items: [Memorize.Card], @ViewBuilder _ content: @escaping (Memorize.Card) -> ItemView) {
        self.aspectRatio = aspectRatio
        self.items = items
        self.content = content
    }
    
    var body: some View {
        GeometryReader { g in
            VStack {
                LazyVGrid(columns: [adaptiveGriditem(width: widthThatFits(itemCount: items.count, in: g.size, itemAspectRatio: aspectRatio))], spacing: 0) {
                    ForEach(items) { item in
                        content(item)
                            .aspectRatio(aspectRatio, contentMode: .fit)
                            .padding(4)
                    }
                }
            }
        }
    }
    
    
    // LazyGridBiew Column GritItem 리턴문.
    private func adaptiveGriditem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    
    // 반응형 그리드뷰 아이템 사이즈 계산 로직
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }

}

