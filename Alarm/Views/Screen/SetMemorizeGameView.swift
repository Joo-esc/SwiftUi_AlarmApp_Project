//
//  MemorizeGameView.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetMemorizeGameView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("설정")
                .responsiveTextify(24, .medium)
            Text("기억력 게임")
                .foregroundColor(.darkGrey)
                .responsiveTextify(16, .medium)
                .padding(.bottom, 40)
            SelectDifficultyView()
                .aspectRatio(330/177, contentMode: .fit)
        }
        .padding(.horizontal,20)
    }
}

struct SelectDifficultyView: View {
    @State private var speed = 0.0
    @State private var isEditing = false
    var body: some View {
        VStack(alignment: .leading){
            Text("난이도")
                .responsiveTextify(14, .bold)
            VStack {
                
                DifficultyRangeIndicator(selectedLevel: speed)
                MemorizeRangeIndicator(selectedLevel: speed)
                    .foregroundColor(.darkGrey)
                    .responsiveTextify(12, .medium)
                Slider(value: $speed, in: 0...4, step: 1) { editing in
                    isEditing = editing
                }
                .tint(.brandColor)
                .padding(.horizontal, 20)
            }
            .roundRectify(8, .center)
        }
    }
}


