//
// MARK: - VIEW MDOEL
// 기상 미션의 난이도 문제 개수 등을 선택 옵션들의 값과 로직을 관리하는 모델
//
//  Created by 이해주 on 2022/01/16.
//
import SwiftUI


class SetAlarm: ObservableObject {
    typealias Option = SetAlarmModel.Alarm
    @Published var model: SetAlarmModel =  SetAlarmModel()
    @Published var alarm: Option =  SetAlarmModel().alarmItem


    
    var labeling: String? {
        model.alarmItem.label
    }
    
    
    // 알람 리스트를 리턴.
    var alarmList: [Option] {
        model.alarmList
    }
    
    //MARK: - Intent
    
    // 알람 저장 로직
    func saveAlarm() {
        model.saveAlarm(alarm)
        resetAlarmData()  // Model Store 데이터 초기화 *리스트에 저장 후 초기화 해야됨*
    }
    
    // 알람 Store 데이터 초기화 로직
    func resetAlarmData() {
        alarm = SetAlarmModel().alarmItem
    }
    
    // 기존 알람을 수정하는 로직
    func editAlarm(_ alarm: Option) {
        model.editAlarm(alarm)
        resetAlarmData()
    }
    
    
    // 기존 옵션 데이터를 수정하는 경우 Model을 전달된 값으로 초기화
    func passData(_ passedAlarm: Option) {
        alarm = passedAlarm
    }
    
    // 선택된 요일의 'isSelect' 프로퍼티를 toggle
    func chooseDay(_ day: Week.Day) {
        alarm.selectedDays[day.id].isSelected.toggle()
        print(alarm.selectedDays)
    }
    

}
