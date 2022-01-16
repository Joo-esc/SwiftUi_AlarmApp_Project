//  MemorizeGameScreen에서 사용되는 Model
//
//  Created by 이해주 on 2022/01/09.


import SwiftUI

class Memorize: ObservableObject {
    static let emojiList = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🫐", "🍑", "🥭", "🍍"]
    
    @Published var isFinished = false 
    @Published private(set) var length: Double
    @Published private(set) var currentRound: Int = 1
    @Published private(set) var totalRound:Int
    @Published private(set) var countDonwTime: Int
    @Published private(set) var model: MemorizeModel<String>
    
    init(length: Double, totalRound: Int, countDonwTime: Int) {
        self.length = length
        self.totalRound = totalRound
        self.countDonwTime = countDonwTime
        self.model = MemorizeModel<String>(cardLength: length) { Memorize.emojiList[$0] }
    }
    

    typealias Card = MemorizeModel<String>.Card
    
    var cards: [Card] {
        model.cards
    }
    
    //MARK: - Intent
    func chooseCard(_ card: Card) {
        model.chooseCard(card)
        // 모든 카드 매칭 될 때 (게임 초기화, 라운드 횟수 증가, 카드 믹스 동작 진행)
        let indicies =  cards.indices.filter {cards[$0].isMatched}
        if indicies.count == cards.count {
            resetGame()
            increaseRound()
            shuffleCard()
        }
    }
    
    // 카드 섞기
    func shuffleCard() {
        model.shuffle()
    }
    
    func printAim() {
        print("DUMMU TIME")
    }
    
    // 게임 초기화
    func resetGame() {
        model.reset()
    }
    
    // 라운드 횟수 증가
    func increaseRound() {
        if currentRound < totalRound {
            currentRound += 1
        } else {
            isFinished = true
        }
        print("currentRound: \(currentRound)")
    }
    
    // 모든 카드가 매칭되었을 경우
    func ifMatchedInc() {
        let cards = model.cards
        let indicies =  cards.indices.filter {cards[$0].isMatched}
        if indicies.count == cards.count {
            increaseRound()
        }
    }
    
   
}




