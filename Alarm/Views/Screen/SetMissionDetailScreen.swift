//
//  각각 선택된 미션에 따라 다른 스크린을 보여줌.
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetMissionDetailScreen: View {
    let id: Int
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color.darkBackground.ignoresSafeArea()
                switch id {
                case 1:
                    SetGameDetailScreen()
                case 2:
                    MathGame()
                    // or else
                default:
                    MathGame()
                }
            }.hiddenNavBarStyle()
        }
    }
}



struct MathGame: View {
    var body: some View {
        Text("Math GAME")
    }
}


