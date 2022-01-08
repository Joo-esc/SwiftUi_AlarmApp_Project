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
        Text("\(String(Int(selectedLevel + 3)))X\(String(Int(selectedLevel + 3)))")
            .foregroundColor(.darkGrey)
            .responsiveTextify(12, .medium)
    }
}

