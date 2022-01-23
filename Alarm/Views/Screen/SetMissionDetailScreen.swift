//
//  각각 선택된 미션에 따라 각각 게임 미션을 설정 스크린을 보여줌.
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetMissionDetailScreen: View {
    let option: SetAlarm // Link ViewModel
    let id: Int
    var body: some View {
            ZStack(alignment: .topLeading) {
                Color.darkBackground.ignoresSafeArea()
                // MARK: - '기억력 게임'과 '수학 게임'은 동일한 스크린을 공유함.
                switch id {
                case 0: // 기억력 게임
                    SetMissionGameScreen(gameName: "기억력 게임", selectedType: 0, option: option)
                case 1: // 수학 게임
                    SetMissionGameScreen(gameName: "수학 게임", selectedType: 1, option: option)
                case 2:
                    OtherGameScreen()
                    // or else
                default:
                    OtherGameScreen()
                }
            }.hiddenNavBarStyle()
        }
}



