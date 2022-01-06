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
    var itemColumns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 100)), count: 2)
    var body: some View {
        NavigationView {
            GeometryReader { g in
                ZStack (alignment:.bottomTrailing) {
                    Color.darkBackground.ignoresSafeArea()
                    ScrollView {
                        VStack (alignment: .leading) {
                            Text("다음 알람")
                                .responsiveTextify(fontSize: 14, fontWeight: .regular)
                                .foregroundColor(Color.lightGrey)
                            Text("\(String(tempHour))시간 \(String(tempMinuite))분 남음")
                                .responsiveTextify(fontSize: 26, fontWeight: .medium)
                            LazyVGrid (columns: itemColumns, spacing: 20 ) {
                                ForEach(tempArray, id: \.self) { item in
                                    AlarmItemView(week: Week())
                                }
                                .aspectRatio(154/162, contentMode: .fit)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                    }
                        FloatingActionButton()
                            .position(x: g.size.width - 52, y: g.size.height - 60)
                }
            }
            .hiddenNavBarStyle()
        }
    }
}





struct AlarmItemView: View {
    var week: Week
    @State private var alarmOnOff = false
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20).foregroundColor(Color.lightDark)
        ZStack {
            shape
            VStack (alignment: .leading) {
                Text("Work")
                    .responsiveTextify(fontSize: 14, fontWeight: .regular)
                HStack (alignment: .firstTextBaseline){
                    Text("8:30")
                        .responsiveTextify(fontSize: 36, fontWeight: .medium)
                    Text("AM")
                        .responsiveTextify(fontSize: 18, fontWeight: .bold)
                }
                Spacer()
                HStack {
                    ForEach (week.weekList) {item in
                        Text(item.content)
                            .responsiveTextify(fontSize: 12, fontWeight: .bold)
                            .weekItemModifier(isSelected: item.isSelected)
                    }
                    
                }
                Toggle(isOn: $alarmOnOff) {
                    Text("")
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
