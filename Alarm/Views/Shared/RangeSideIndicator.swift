//
//  RangeSideIndicator.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct RangeSideIndicator: View {
    var body: some View {
        HStack {
            IndicatorItem(emoji: "🙂", title: "매우 쉬움")
            Spacer()
            IndicatorItem(emoji: "🤯", title: "매우 어려움")
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
    }
}

struct IndicatorItem: View {
    private(set) var emoji: String
    private(set) var title: String
    var body: some View {
        HStack {
            Text(emoji).responsiveTextify(12, .medium)
            Text(title)
                .foregroundColor(.darkGrey)
                .responsiveTextify(12, .medium)
        }
    }
}
