//
//  알람 옵션을 선택하는 스크린. 모든 옵션값을 설정하는 섹션의 기준이됨.
//
//  Created by 이해주 on 2022/01/07.
//

import SwiftUI

struct SetAlarmScreen: View {
    @ObservedObject var option: SetAlarm
    @State private var isModalShow = false
    @Environment(\.presentationMode) var presentationMode // goBack() 로직을 실행하기 위한 설정
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.darkBackground.ignoresSafeArea()
                VStack {
                    TimeSelectSection(startDate: $option.time)
                    MissionSelectSection(option: option, selectedType: option.missionType
                    )
                    DaySelectSection(option: option, weekList: option.selectedDays, showModal: showModal)
                    LabelSelectSection(option: option)
                    Spacer()
                    BottomDivStackButton(isDivided: true, leftTitle: "취소", leftAction: showModal, rightTitle: "저장", rightAction: saveAlarm)
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
    func saveAlarm() {
        option.saveAlarm()
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    private struct Style {
        static let hPadding: CGFloat = 20
        static let heightScale: CGFloat = 0.6
    }
}






