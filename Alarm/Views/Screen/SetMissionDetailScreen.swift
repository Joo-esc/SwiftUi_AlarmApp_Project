//
//  MemorizeGameScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetMissionDetailScreen: View {
    let id: Int
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.darkBackground.ignoresSafeArea()
            switch id {
            case 1:
                SetMemorizeGameView()
            case 2:
                MathGame()
            default:
                MathGame()
            }
        }
    }
}



struct MathGame: View {
    var body: some View {
        Text("Math GAME")
    }
}


