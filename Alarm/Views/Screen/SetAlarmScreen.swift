//
//  AddEditAlarmScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/07.
//

import SwiftUI

struct SetAlarmScreen: View {
    @ObservedObject var option = SetAlarm()
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkBackground.ignoresSafeArea()
                VStack {
                    Text("check").responsiveTextify(13, .bold)
                        .onTapGesture {
                            print(option.round)
                        }
                    TimeSelectView(startDate: $option.time)
                        .aspectRatio(330/181, contentMode: .fit)
                    MissionSelectSection(title: "미션", canRoute: true,
                                         option: option,
                                         selectedType: option.missionType
                    )
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .hiddenNavBarStyle()
        }
    }
}

struct TimeSelectView: View {
    @Binding var startDate:Date
    
    var body: some View {
        VStack (alignment: .center) {
            HStack () {
                Spacer()
                Image(systemName: "clock")
                    .frame(width:  14, height: 14)
                    .foregroundColor(.white)
                RemainTime(startDate : $startDate)
                Spacer()
            }
            .padding(.top, 14)
            .onTapGesture {
                print(startDate)
            }
            Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
            DatePicker("", selection: $startDate,
                       displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .colorInvert().colorMultiply(.white)
            
            Spacer()
        }.roundRectify(8, .leading)
    }
}

/*
 - 초기 설정시 TimeSelecter에는 1분 뒤로 설정되어 있어햠
 - useEffect개념이 들어가 있어야할듯.
 */



//struct MissionSelectView : View {
//    @State var selectedOption: String?
//    var body: some View {
//            ZStack {
//                HStack {
//                    Text("미션").responsiveTextify(12, .bold)
//                    Spacer()
//                    NavigationLink(destination: ChooseMissionScreen(mission: Mission())) {
//                        Text("선택안함")
//                        .foregroundColor(selectedOption != nil ? .brandColor : .lightGrey)}
//                        .responsiveTextify(12, .regular)
//                }
//            }
//
//        .padding(.horizontal, 18)
//        .roundRectify(8, .leading)
//    }
//}
//
//
//


