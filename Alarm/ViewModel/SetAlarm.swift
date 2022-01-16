//
// MARK: - VIEW MDOEL
// 기상 미션의 난이도 문제 개수 등을 선택 옵션들의 값과 로직을 관리하는 모델
//
//  Created by 이해주 on 2022/01/16.
//

import SwiftUI


class SetAlarm: ObservableObject {
    typealias Option = SetAlarmModel.AlarmOption
    @Published var model: SetAlarmModel = SetAlarmModel(id: 3)
    @Published var time = Date()
    @Published var missionType: Int?
 
    
    var options: Option {
        model.alarmOption
    }
    
}
