//
//  기억력 게임 스크린[기상 시면]
//  Created by 이해주 on 2022/01/09.
//

import SwiftUI

struct MemorizeGameScreen: View {
    @ObservedObject var game: Memorize
    var body: some View {
      
        NavigationView {
            ZStack {
                Color.darkBackground.ignoresSafeArea()
              
                VStack() {
                    GameNumIndicator()
                        AspectVGrid(ScreenStyle.aspectRatio, game.cards) { item in
                            if item.isMatched {
                                Rectangle().opacity(0.0)
                            } else {
                                CardView(card:item)
                                    .onTapGesture {
                                        game.chooseCard(item)
                                    }
                            }
                        }
                        Spacer()
                    Text("hi").responsiveTextify(14, .bold)
                    
                .padding(.horizontal, 16)
                }
            } .hiddenNavBarStyle()
        }
    }
    
    private struct ScreenStyle {
        static let aspectRatio: CGFloat = 98/127
        static let cardSize: CGFloat = 100
        static let horizonPad: CGFloat = 20
    }
}

// 기억력 카드 게임에서 사용되는 카드 뷰
struct CardView: View {
    var card: Memorize.Card
    var body: some View {
        ZStack {
            Text(card.content).cardify(isSelected: card.isSelected)
        }
    }
}


// 게임 횟수를 보여주는 인디케이터
struct GameNumIndicator: View {
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Text("1/3").responsiveTextify(IndicatorStyle.textScale, .medium)
            }
            .roundRectify(IndicatorStyle.radius, .center)
            .frame(width: IndicatorStyle.width, height: IndicatorStyle.height)
        }
    }
    
     private struct IndicatorStyle {
        static let textScale: CGFloat = 24
        static let radius: CGFloat = 12
        static let width: CGFloat = 90
        static let height: CGFloat = 47
        
    }
}



func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
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
