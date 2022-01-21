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
        set{ cards.indices.forEach { if cards[$0].isSelected {cards[$0].isSelected = false}} }
    }
    
    // 카드 컨텐츠 내용 확인, 동일 카드 선택 여부 판단
    mutating func chooseCard(_ card: Card) {
        // 조건  : 카드가 이전에 선택되거나 매칭되지 않았을 경우
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }),
           !cards[chosenIndex].isSelected,
           !cards[chosenIndex].isMatched {
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
    
    // 카드 순서를 섞는 로직
    mutating func shuffle() {
        cards.shuffle()
    }
    
    // 게임을 리셋, 모든 카드 아이템 값 초기화.
    mutating func reset() {
        cards.indices.forEach { if cards[$0].isSelected || cards[$0].isMatched {
            cards[$0].isSelected = false
            cards[$0].isMatched = false
            }
        }
    }
    
    init(cardLength: Double, createCardContent: (Int) -> CardContent) {
        cards = []
        // 초기화된 'cardLenght' 값에 따라 카드 쌍의 개수가 결정됨.
        for index in 0 ..< Int(cardLength) + 2 { // 설정된 난이도에 따라 2의 배수로 카드의 개수가 정해짐
            let content = createCardContent(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        // 카드 순서를 무작위로 섞음.
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
