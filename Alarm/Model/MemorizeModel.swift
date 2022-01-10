//
// MemorizeGameScreen에서 사용되는 ViewModel
// 모델에서 제공하는 타입의 컨텐츠들을 관리, 특정 Intent 동작들을 관리하는 GateKeeper 역할 수행
//
// Created by 이해주 on 2022/01/09.

import Foundation

struct MemorizeModel<CardContent> where CardContent: Equatable{
    private(set) var cards: [Card]
    private(set) var prevIndex: Int? {
        get { let cardIndicies = cards.indices.filter { index in cards[index].isSelected }
            if cardIndicies.count == 1 {
                return cardIndicies.first
            } else {
                return nil
            }
            
        }
        set{}
    }
    
    // 카드 컨텐츠 내용 확인, 동일 카드 선택 여부 판단
    mutating func chooseCard(_ card: Card) {
        let selectedIndex = card.id
        // 조건 : 이전에 선택된 카드가 있다면
//        if let chosenIndex = cards.first(where: { $0.id == card.id}), !cards[chosenIndex].isSelected, !cards[chosenIndex].isMatched {
            //        if !cards[selectedIndex].isSelected || !cards[selectedIndex].isMatched {
            if let willMatchIndex = prevIndex {
                // 조건 : 선택된 두 카드의 컨텐츠가 동일한다면
                if (cards[willMatchIndex].content == cards[selectedIndex].content) {
                    // matched Boolean값을 true로 변경
                    cards[willMatchIndex].isMatched = true
                    cards[selectedIndex].isMatched = true
                }
                prevIndex = nil
            } else {
                for index in cards.indices {
                    cards[index].isSelected = false
                }
            }
            cards[selectedIndex].isSelected.toggle()
//        }
        
    }
    
    init(cardLength: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // 초기화된 'cardLenght' 값에 따라 카드 쌍의 개수가 결정됨.
        for index in 0 ..< cardLength {
            let content = createCardContent(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
    }
    
    struct Card:Identifiable {
        var isSelected = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

