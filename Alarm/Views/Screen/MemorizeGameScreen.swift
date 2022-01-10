//
//  MemorizeGameScreen.swift
//  Alarm
//
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
                    RoundIndicator()
                    GeometryReader { g in
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: g.size.width * 0.3, maximum: g.size.width * 0.6))]) {
                            ForEach(game.cards) { item in
                                CardView(card: item)
                                    .aspectRatio(98/127, contentMode: .fit)
                                    .onTapGesture {
                                        game.chooseCard(item)
                                    }
                              }
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
            } .hiddenNavBarStyle()
        }
    }
}

struct CardView: View {
    var card: Memorize.Card
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if card.isSelected {
                EmptyView().foregroundColor(.red).roundRectify(12, .center, .lightPurple)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.white)
                Text(card.content)
            }
            else if card.isMatched {
                shape.opacity(0.0)
            }
            else {
                EmptyView()
                    .roundRectify(12, .center)
            }
        }
    }
}

struct RoundIndicator: View {
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Text("1/3").responsiveTextify(24, .medium)
            }
            .roundRectify(12, .center)
            .frame(width: 90, height: 47)
        }
    }
}



//func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
//    var columnCount = 1
//    var rowCount = itemCount
//    repeat {
//        let itemWidth = size.width / CGFloat(columnCount)
//        let itemHeight = itemWidth / itemAspectRatio
//        if CGFloat(rowCount) * itemHeight < size.height {
//            break
//        }
//        columnCount += 1
//        rowCount = (itemCount + (columnCount - 1)) / columnCount
//    } while columnCount < itemCount
//    if columnCount > itemCount {
//        columnCount = itemCount
//    }
//    return floor(size.width / CGFloat(columnCount))
//}
