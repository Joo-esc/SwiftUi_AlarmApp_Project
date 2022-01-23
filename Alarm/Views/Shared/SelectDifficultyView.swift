//
// 문제 난이도를 설정하는 뷰
// Component 예외처리, 전달받은 missionType프로퍼티에 따라
// 난이도 View Indicator가 달라짐.
//  Created by 이해주 on 2022/01/21.
//

import SwiftUI

struct SelectDifficultyView: View {
    let selectedType: Int?
    @State var selectedLevel: Double
    @State var option: SetAlarm
   
    @State private var isEditing = false
    var body: some View {
        VStack(alignment: .leading){
            Text("난이도")
                .responsiveTextify(14, .bold)
            VStack {
                DifficultyRangeIndicator(selectedLevel: selectedLevel)
                MemorizeRangeIndicator(
                    missionType: selectedType,
                    selectedLevel: selectedLevel)
                    .foregroundColor(.darkGrey)
                    .responsiveTextify(12, .medium)
                Slider(value: $selectedLevel, in: 0...4, step: 1) { _ in
                    option.alarm.level = selectedLevel
                }
                .tint(.brandColor)
                .padding(.horizontal, 20)
                RangeSideIndicator()
            }
            .roundRectify(8, .center)
        }
    }
}


