//
// SetAlarmScreen에서 사용되는 시간 선택 옵션 뷰
//
//  Created by 이해주 on 2022/01/20.
//

import SwiftUI

struct TimeSelectSection: View {
    @Binding var startDate:Date
    
    var body: some View {
        VStack (alignment: .center) {
            HStack () {
                Spacer()
                Image(systemName: "clock")
                    .frame(width:  Style.iconSize, height: Style.iconSize)
                    .foregroundColor(.white)
                RemainTime(startDate : $startDate)
                Spacer()
            }
            .padding(.top, Style.tPadding)
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
        }
        .roundRectify(Style.containerRadius, .leading)
        .aspectRatio(Style.containerRatio, contentMode: .fit)
    }
    
    private struct Style {
        static let iconSize: CGFloat = 14
        static let tPadding: CGFloat = 14
        static let containerRadius: CGFloat = 8
        static let containerRatio: CGFloat = 330/181
    }
}

