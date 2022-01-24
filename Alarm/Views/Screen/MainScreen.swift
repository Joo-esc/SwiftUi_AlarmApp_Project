//
//  메인 스크린. 알람 리스트를 관리.
//  Created by 이해주 on 2022/01/06.
//

import SwiftUI

// TODO: 알림 리스트, 시간 우선순위 로직 적용 필요.
let tempHour = 5
let tempMinuite = 35

struct MainScreen: View {
    var week: Week
    @ObservedObject var alarm = SetAlarm()
    var itemColumns: [GridItem] = Array(repeating: .init(.adaptive(minimum: Style.itemColumsSize)), count: 2)
    @State private var goToNewView: Bool = false
    @State private var selectedItem: SetAlarm.Option = SetAlarm().alarm
    var body: some View {
        NavigationView {
            GeometryReader { g in
                ZStack (alignment:.bottomTrailing) {
                    Color.darkBackground.ignoresSafeArea()
                    ScrollView {
                        VStack (alignment: .leading) {
                            Text("다음 알람")
                                .responsiveTextify(Style.headerTSize, .regular)
                                .foregroundColor(Color.lightGrey)
                            Text("\(String(tempHour))시간 \(String(tempMinuite))분 남음")
                                .responsiveTextify(Style.reaminTimeTSize, .medium)
                            LazyVGrid (columns: itemColumns, spacing: Style.gridSpace ) {
                                ForEach(alarm.alarmList) { item in
                                    AlarmItemView(
                                        goToNewView: $goToNewView,
                                        option: item,
                                                  week: Week(), alarmOnOff: item.isActivate)
                                        .onTapGesture {
                                            selectedItem = item
                                            alarm.passData(item) // VM 데이터 전달
                                            self.goToNewView.toggle() // 수정 페이지로 Route
                                        }
                                        .background(
                                            // 개별 알람 수정&설정 페이지로 이동하는 라우트 동작
                                            NavigationLink(destination: SetAlarmScreen(option: alarm), isActive: self.$goToNewView) { EmptyView() }.hidden()
                                        )
                                }
                                .aspectRatio(Style.gridItemRatio, contentMode: .fit)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, Style.hPadding)
                    }
                    FloatingActionButton(option: alarm)
                        .position(x: g.size.width - Style.xComputeSize, y: g.size.height - Style.yComputeSize)
                }
            }
            .hiddenNavBarStyle()
        }
    }
    private struct Style {
        static let itemColumsSize: CGFloat = 100
        static let headerTSize: CGFloat = 14
        static let reaminTimeTSize: CGFloat = 26
        static let gridSpace: CGFloat = 20
        static let gridItemRatio: CGFloat = 154/162
        static let hPadding: CGFloat = 20
        static let xComputeSize: CGFloat = 52
        static let yComputeSize: CGFloat = 60
        
    }
}








struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(week: Week())
    }
}
