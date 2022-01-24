//
//  SetMissionDetailScreen에서 사용되는 뷰
//  Created by 이해주 on 2022/01/24.
//

import SwiftUI


// 문제 개수를 설정하는 뷰
struct SelectGameNumberView: View {
    @State var selectedRound: Int
    var option: SetAlarm
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("문제 개수").responsiveTextify(14, .bold)
                Text("범위 1~20")
                    .foregroundColor(.darkGrey)
                    .responsiveTextify(12, .medium)
            }
            VStack {
                Picker(selection: $selectedRound, label: Text("")) {
                    ForEach(0..<20) { index in
                        Text(String(index))
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: selectedRound, perform: { newValue in
                    option.alarm.round = Double(newValue)
                })
            }
            .roundRectify(8, .leading)
        }
    }
}
