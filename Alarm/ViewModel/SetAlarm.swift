//
// MARK: - VIEW MDOEL
// 기상 미션의 난이도 문제 개수 등을 선택 옵션들의 값과 로직을 관리하는 모델
//
//  Created by 이해주 on 2022/01/16.
//

import SwiftUI


class SetAlarm: ObservableObject {
    typealias Option = SetAlarmModel.Alarm
    @Published var model: SetAlarmModel = SetAlarmModel()
    @Published var time = Date()
    @Published var missionType: Int?
    @Published var level: Double = 0.0
    @Published var round: Double = 3.0
    @Published var selectedDays = Week().weekList
    @Published var label: String?
    
    
    
    // 선택된 요일의 'isSelect' 프로퍼티를 toggle
    func chooseDay(_ day: Week.Day) {
        selectedDays[day.id].isSelected.toggle()
    }
    
    
    var alarmList: [Option] {
        model.alarmList
    }
    
    //MARK: - Intent
    func saveAlarm() {
        model.saveAlarm(Option(id: UUID(), time: time, missionType: missionType, level: Int(level), round: Int(round), selectedDays: selectedDays, label: label, isActivate: true))
    
    }
}
