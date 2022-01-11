//  MemorizeGameScreen에서 사용되는 Model
//
//  Created by 이해주 on 2022/01/09.


import SwiftUI

class Memorize: ObservableObject {
    typealias Card = MemorizeModel<String>.Card
    static let emojiList = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🫐", "🍑", "🥭", "🍍"]
    
    @Published private(set) var model: MemorizeModel<String> = MemorizeModel<String>(cardLength: 8) { emojiList[$0] }
    
    var cards: [Card] {
        model.cards
    }
    
    //MARK: - Intent
    func chooseCard(_ card: Card) {
        model.chooseCard(card)
    }
    
   
}

