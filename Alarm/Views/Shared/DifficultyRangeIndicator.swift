//
//  DifficultyRangeIndicator.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct DifficultyRangeIndicator: View {
    var selectedLevel: Double
    private(set) var levelIndicater: [Level] = [
        Level(emoji: "😆", title: "매우 쉬움"),
        Level(emoji: "😃", title: "쉬움"),
        Level(emoji: "🙂", title: "보통"),
        Level(emoji: "🤔", title: "어려움"),
        Level(emoji: "🤯", title: "매우 어려움"),
    ]
    

    var body: some View {
        HStack {
            Text(levelIndicater[Int(selectedLevel)].emoji)
            Text(levelIndicater[Int(selectedLevel)].title)
        }
        .padding(.bottom, 1)
        .responsiveTextify(16, .bold)
    }
    
    struct Level {
       let emoji: String
       let title: String
    }
}

