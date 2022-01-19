//
//  알람 옵션을 선택하는 스크린. 모든 옵션값을 설정하는 섹션의 기준이됨.
//
//  Created by 이해주 on 2022/01/07.
//

import SwiftUI

struct SetAlarmScreen: View {
    @ObservedObject var option = SetAlarm()
    @State private var isModalShow = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.darkBackground.ignoresSafeArea()
                VStack {
                    TimeSelectSection(startDate: $option.time)
                    MissionSelectSection(option: option, selectedType: option.missionType
                    )
                    DaySelectSection(option: option, weekList: option.selectedDays, showModal: showModal)
                    LabelSelectSection(option: option, label: option.label)
                    Spacer()
                    BottomDivStackButton(isDivided: true, leftTitle: "취소", leftAction: showModal, rightTitle: "저장", rightAction: showModal)
                }
                .padding(.horizontal, Style.hPadding)
                // MARK: - Modal Dialog 뷰
                GeometryReader { g in
                    DaySelectModal(showModal: $isModalShow, option: option, screenHeight: g.size.height * Style.heightScale)
                }
            }
            .hiddenNavBarStyle()
        }
    }
    
    func showModal() { isModalShow.toggle() }
    
    private struct Style {
        static let hPadding: CGFloat = 20
        static let heightScale: CGFloat = 0.6
    }
}






