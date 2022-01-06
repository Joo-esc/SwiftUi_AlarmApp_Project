// MARK: MODEL
// DayOfWeekList View에서 사용되는 모델
// 요일과 선택된 유무 값을 store함


import SwiftUI

struct WeekModel {
    private(set) var weekItem: [Week]
    
    func chooseWeek(_ week: Week) {
        print(week)
    }
    
    init(createContent: (Int) -> String){
        weekItem = []
        // 요일 값 초기화
        for index in 0..<7 {
            weekItem.append(Week(content: createContent(index), id: index))
        }
        
    }
    
    struct Week: Identifiable {
        var isSelected = false
        var content: String
        var id: Int
    }
}
