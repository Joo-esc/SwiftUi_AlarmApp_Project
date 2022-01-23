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
                                    AlarmItemView(option: item,
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
    var option: SetAlarm.Option
    var week: Week
    @State var alarmOnOff: Bool
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20).foregroundColor(Color.lightDark)
        ZStack {
            shape
            VStack (alignment: .leading) {
                Text(option.label ?? "")
                    .responsiveTextify(14, .regular)
                Text(option.time, style : .time)
                    .responsiveTextify(26, .medium)
                Spacer()
                HStack {
                    ForEach (option.selectedDays) { item in
                        Text(item.content)
                            .weekItemModifier(isSelected: item.isSelected)
                            .responsiveTextify(12, .bold)
                    }
                    
                }
                Toggle(isOn: $alarmOnOff) {
                    EmptyView()
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.brandColor))
            }
        }
        .padding(.horizontal, 22.0)
        .padding(.vertical, 16.0)
        .background(Color.lightDark)
        .cornerRadius(20)
        
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(week: Week())
    }
}
