

//
//  MARK: - MODEL
//  기상 미션의 난이도 문제 개수 등의 선택 옵션 값과 로직을 관리하는 모델
//  Created by 이해주 on 2022/01/16.
//
import Foundation

struct SetAlarmModel {
    // 개별 알람 옵션 아이템
    var alarmItem: Alarm
    
    
    init() {
        alarmItem = Alarm(id: nil)
    }
    
    // 임시 알람 데이터 리스트, 실제 환경에서는 LocalDB나 서버로부터 데이터를 받아와야됨
    var alarmList: [Alarm] = [
        Alarm(id: UUID(), time: Calendar.current.date(byAdding: .hour, value: 5, to: Date())!, missionType: 0, level: 1, round: 4, selectedDays: Week().weekList, label: "운동", isActivate: true),
        Alarm(id: UUID(), time: Calendar.current.date(byAdding: .hour, value: -5, to: Date())!, missionType: 0, level: 1, round: 3, selectedDays: Week().weekList, label: nil, isActivate: false),
    ]
    
    // MARK: - Main Business Logic
    
    // 알림리스트에 새로운 알람을 추가하는 기능
    mutating func saveAlarm(_ alarm: Alarm) {
        alarmList.append(alarm)
    }
    
    // 기존 알람에서 수정된 옵션값들은 저장하는 로직
    mutating func editAlarm(_ alarm: Alarm) {
        let listIndex = alarmList.firstIndex { item in
            item.id == alarm.id
        }
        alarmList[listIndex!] = alarm
    }


    struct Alarm: Identifiable {
        var id: UUID? // 추가, 수정을 구분하기 위해 var 변수 선언
        var time: Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date())! // 알람 시간
        var missionType: Int? // 미션 종류
        var level: Double? = 1.0 // 게임 미션 난이도
        var round: Double? = 4.0 // 게임 미션 라운드
        var selectedDays: [Week.Day] =  Week().weekList// 선택된 요일이 있을 경우 반복 X, 반대의 경우 반복 허용
        var label: String? // 선택된 문구가 없을 경우 nil 값으로 문구 선택 여부를 판별
        var isActivate = true // 알람 활성화 여부
    }
}
