//
//  AlarmApp.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/06.
//

import SwiftUI

@main
struct AlarmApp: App {
    var body: some Scene {
        WindowGroup {
            
            MemorizeGameScreen(game: Memorize(length: 2, totalRound: 4, countDonwTime: 60))
            //            SetMissionDetailScreen(id: 1)
            //            ChooseMissionScreen(mission: Mission())
            //            AddEditAlarmScreen()
            //               MainScreen(week: Week())
        }
    }
}
