//  MemorizeGameScreen에서 사용되는 Model
//
//  Created by 이해주 on 2022/01/09.


import SwiftUI

class Memorize: ObservableObject {
    typealias Card = MemorizeModel<String>.Card
    static let emojiList = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🫐", "🍑", "🥭", "🍍"]
    
    @Published private(set) var model: MemorizeModel<String> = MemorizeModel<String>(cardLength: 2) { emojiList[$0] }
    
    var cards: [Card] {
        model.cards
    }
    
    //MARK: - Intent
    func chooseCard(_ card: Card, increaseRound: () -> Void, resetTime: () -> Void)  {
        model.chooseCard(card)
        // 모든 카드 매칭 될 때
        let indicies =  cards.indices.filter {cards[$0].isMatched}
        if indicies.count == cards.count {
            resetGame()
            increaseRound()
            shuffleCard()
        }
    }
    
    func shuffleCard() {
        model.shuffle()
    }
    
    func resetGame() {
        model.reset()
    }
}

