//
//  MARK: VIEW MODEL
// DayOfWeekList View에서 사용되는 뷰모델


import Foundation

class Week {
    typealias Week = WeekModel.Week
    static let tempWeekList: [String] = ["S", "M", "T", "W", "T", "F", "S"]
    
    private(set) var model: WeekModel = WeekModel { index in
        tempWeekList[index]
    }
    
    var weekList: [Week] {
        model.weekItem
    }
}
