//
//  AddEditAlarmScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/07.
//

import SwiftUI

struct SetAlarmScreen: View {
    @ObservedObject var option = SetAlarm()
    @State private var isModalShow = true
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.darkBackground.ignoresSafeArea()
                VStack {
                    Text("check").responsiveTextify(13, .bold)
                        .onTapGesture {
                            showModal()
                        }
                    TimeSelectView(startDate: $option.time)
                        .aspectRatio(330/181, contentMode: .fit)
                    MissionSelectSection(title: "미션", canRoute: true,
                                         option: option,
                                         selectedType: option.missionType
                    )
                    DaySelectSection()
                    Spacer()
                }
                .padding(.horizontal, 20)
                // MARK: - Modal Pop up
                GeometryReader { g in
                    DaySelectModal(showModal: $isModalShow, option: option, screenHeight: g.size.height * 0.6)
                }
            }
            .hiddenNavBarStyle()
        }
    }
    
    func showModal() {
            isModalShow.toggle()
    }
}




struct DaySelectSection: View {
    var isSelected = false
    var body: some View {
        ZStack {
            HStack {
                Text("반복").responsiveTextify(12, .bold)
                Spacer()
                Text("선택안함")
                    .foregroundColor(isSelected ? .brandColor : .lightGrey)
                    .responsiveTextify(12, .regular)
            }
            
        }
        
        .padding(.horizontal, 18)
        .roundRectify(8, .leading)
        .aspectRatio(330/53, contentMode: .fit)
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


