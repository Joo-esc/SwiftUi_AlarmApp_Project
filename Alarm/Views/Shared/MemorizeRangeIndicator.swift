//
//  SliderRangeIndicator.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct MemorizeRangeIndicator: View {
    var selectedLevel: Double
    var body: some View {
        //  0 1 2 3 4
        Text("\(String(Int((selectedLevel * 2) + 4)))개의 카드")
            .foregroundColor(.darkGrey)
            .responsiveTextify(12, .medium)
    }
}

