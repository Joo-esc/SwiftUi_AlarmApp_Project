//
//  SliderRangeIndicator.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct MemorizeRangeIndicator: View {
    let missionType: Int?
    let selectedLevel: Double
    private(set) var exMathProblem: [String] = [
        "6 + 2", "12 + 7", "43 + 29", "3 X 21 + 46", "21 X 3 X 9"
    ]
    var body: some View {
        // 전달 받은 미션의 종류에 따라 각각의 Indicator Context를 변환함.
        //  0 1 2 3 4
        switch missionType {
        case 0:
        Text("\(String(Int((selectedLevel * 2) + 4)))개의 카드")
                .foregroundColor(.darkGrey)
                .responsiveTextify(12, .medium)
        case 1:
        Text(exMathProblem[Int(selectedLevel)])
                .foregroundColor(.darkGrey)
                .responsiveTextify(12, .medium)
            
        default:
            Text("Else")
        }

    }
}

