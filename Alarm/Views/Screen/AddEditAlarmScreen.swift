//
//  AddEditAlarmScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/07.
//

import SwiftUI

struct AddEditAlarmScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkBackground.ignoresSafeArea()
                VStack {
                    TimeSelectView()
                        .aspectRatio(330/181, contentMode: .fit)
                    MissionSelectView()
                        .aspectRatio(330/53, contentMode: .fit)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .hiddenNavBarStyle()
        }
    }
}

//Button(action: {
//    print("Modal")
//}) {
//
//}


struct MissionSelectView : View {
    @State var selectedOption: String?
    var body: some View {
            ZStack {
                HStack {
                    Text("미션").responsiveTextify(fontSize: 12, fontWeight: .bold)
                    Spacer()
                    NavigationLink(destination: ChooseMissionScreen()) {
                        Text("선택안함")
                        .foregroundColor(selectedOption != nil ? .brandColor : .lightGrey)}
                        .responsiveTextify(fontSize: 12, fontWeight: .regular)
                }
            }
        
        .padding(.horizontal, 18)
        .roundRectify(conrerRadius: 8)
    }
}


/*
 - 초기 설정시 TimeSelecter에는 1분 뒤로 설정되어 있어햠
 - useEffect개념이 들어가 있어야할듯.
 */

struct TimeSelectView: View {
    @State var startDate:Date = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
    
    //    @State private var remainTime = computeTime(startDate: startDate, endDate: endDate)
    var body: some View {
        VStack (alignment: .center) {
            HStack () {
                Spacer()
                Image(systemName: "clock")
                    .frame(width:  14, height: 14)
                    .foregroundColor(.white)
                RemainTime(startDate : $startDate)
                Spacer()
            }.padding(.top, 14)
            Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
            DatePicker("", selection: $startDate,
                       displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .colorInvert().colorMultiply(.white)
            
            Spacer()
        }.roundRectify(conrerRadius: 8)
    }
    
}


struct AddEditAlarmScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddEditAlarmScreen()
    }
}
