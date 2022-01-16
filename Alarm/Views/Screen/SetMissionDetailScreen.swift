//
//  각각 선택된 미션에 따라 다른 스크린을 보여줌.
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetMissionDetailScreen: View {
    let option: SetAlarm // Link ViewModel
    let id: Int
    var body: some View {
            ZStack(alignment: .topLeading) {
                Color.darkBackground.ignoresSafeArea()
                switch id {
                case 0:
                    SetMemorizeGameScreen(selectedType: 0, option: option)
                case 1:
                    MathGameScreen()
                case 2:
                    OtherGameScreen()
                    // or else
                default:
                    OtherGameScreen()
                }
            }.hiddenNavBarStyle()
        }
}



