//
//  MARK: - MODEL
//  기상 미션의 난이도 문제 개수 등의 선택 옵션 값과 로직을 관리하는 모델
//  Created by 이해주 on 2022/01/16.
//

import Foundation

struct SetAlarmModel {
  
    var alarmOption: AlarmOption
    
    
    init(id: Int) {
        alarmOption = AlarmOption(id: 3)
    }
    
    
    
    struct AlarmOption: Identifiable {
        let id: Int
        var time: Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
        var missionType: Int?
        var selectedDay: Date? // 선택된 요일이 있을 경우 반복 X, 반대의 경우 반복 허용
        var label: String? // 선택된 문구가 없을 경우 nil 값으로 문구 선택 여부를 판별
        var gameLevel: Int = 0
        var gameRound: Int = 1
    }
}
