//
// MemorizeGameScreen에서 사용되는 Model
// 내부 동작 로직과 ViewModel로 부터 전달받은 값들을 기반으로 Data를 초기화.
//
// Created by 이해주 on 2022/01/09.

import Foundation

struct MemorizeModel<CardContent> where CardContent: Equatable{
    private(set) var cards: [Card]
    private(set) var prevIndex: Int? {
        // 카드가 하나 선택되었을 경우 선택된 카드의 id 값을 리턴하고 반대의 경우 nil 값을 리턴
        get { cards.indices.filter { cards[$0].isSelected}.onAndOnly }
        // 선택된 카드들만 'isSelected' Boolean 값을 false로 변경
        set{cards.indices.forEach { if cards[$0].isSelected {cards[$0].isSelected = false}}}
    }
    
    // 카드 컨텐츠 내용 확인, 동일 카드 선택 여부 판단
    mutating func chooseCard(_ card: Card) {

        let selectedIndex = card.id
        print("1. selectedIndex = \(selectedIndex)")
        // 조건  : 카드가 이전에 선택되거나 매칭되지 않았을 경우
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }) {
            print("2. chosenIndex = \(chosenIndex)")
            if let willMatchIndex = prevIndex {
                // 조건 : 선택된 두 카드의 컨텐츠가 동일한다면
                if (cards[willMatchIndex].content == cards[chosenIndex].content) {
                    // matched Boolean값을 true로 변경
                    cards[willMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
            } else {
                prevIndex = chosenIndex
            }
            cards[chosenIndex].isSelected.toggle()
        }
    }
    
    init(cardLength: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // 초기화된 'cardLenght' 값에 따라 카드 쌍의 개수가 결정됨.
        for index in 0 ..< cardLength {
            let content = createCardContent(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        cards = cards.shuffled()
    }
    
    struct Card:Identifiable {
        var isSelected = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}


// 전달받은 배열의 길이가 1일 경우에 첫번 째 원소를 리턴하는 Extension
extension Array {
    var onAndOnly: Element? {
        if self.count == 1 {
            return first
        } else {
            return nil
        }
    }
}
