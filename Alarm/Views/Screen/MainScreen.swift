//
//  MainScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/06.
//

import SwiftUI

let tempArray = ["1", "2", "3", "4", "5"]
let tempHour = 5
let tempMinuite = 35

struct MainScreen: View {
    var week: Week
    @ObservedObject var alarm = SetAlarm()
    var itemColumns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 100)), count: 2)
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
                                .responsiveTextify(14, .regular)
                                .foregroundColor(Color.lightGrey)
                            Text("\(String(tempHour))시간 \(String(tempMinuite))분 남음")
                                .responsiveTextify(26, .medium)
                                .onTapGesture {
                                    print(alarm.alarmList[2].level ?? "defaul") }
                            LazyVGrid (columns: itemColumns, spacing: 20 ) {
                                ForEach(alarm.alarmList) { item in
                                    AlarmItemView(
                                        goToNewView: $goToNewView,
                                        option: item,
                                                  week: Week(), alarmOnOff: item.isActivate)
                                        .onTapGesture {
                                            selectedItem = item
                                            alarm.passData(item)
                                            self.goToNewView.toggle()
                                        }
                                        .background(
                                            // 개별 알람 수정&설정 페이지로 이동하는 라우트 동작
                                            NavigationLink(destination: SetAlarmScreen(option: alarm), isActive: self.$goToNewView) { EmptyView() }.hidden()
                                        )
                                }
                                .aspectRatio(154/162, contentMode: .fit)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                    }
                    FloatingActionButton(option: alarm)
                        .position(x: g.size.width - 52, y: g.size.height - 60)
                }
            }
            .hiddenNavBarStyle()
        }
    }
}





struct AlarmItemView: View {
    @Binding var goToNewView: Bool
    var option: SetAlarm.Option
    var week: Week
    @State var alarmOnOff: Bool
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: Style.recCornerSize).foregroundColor(Color.lightDark)
        ZStack {
            shape
            VStack (alignment: .leading) {
                Text(option.label ?? "")
                    .responsiveTextify(Style.labelTSize, .regular)
                Text(option.time, style : .time)
                    .responsiveTextify(Style.timeTSize, .medium)
                Spacer()
                HStack {
                    ForEach (option.selectedDays) { item in
                        Text(item.content)
                            .weekItemModifier(isSelected: item.isSelected)
                            .responsiveTextify(Style.weekTSize, .bold)
                    }
                    
                }
                Toggle(isOn: $alarmOnOff) {
                    EmptyView()
                }
                .onTapGesture {
                    // Just to Prevent Duplicate Touch Issue
                }
                
                .toggleStyle(SwitchToggleStyle(tint: Color.brandColor))
            }
        }
        .padding(.horizontal, Style.hPadding)
        .padding(.vertical, Style.vPadding)
        .background(Color.lightDark)
        .cornerRadius(Style.recCornerSize)
      
    }
    
    private struct Style {
        static let recCornerSize: CGFloat = 20
        static let labelTSize: CGFloat = 14
        static let timeTSize: CGFloat = 26
        static let weekTSize: CGFloat = 12
        static let hPadding: CGFloat = 22
        static let vPadding: CGFloat = 16
        
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(week: Week())
    }
}
