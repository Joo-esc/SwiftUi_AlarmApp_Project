//
//  MemorizeGameView.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetGameDetailScreen: View { 
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
                    .padding(.bottom, 40)
                SelectGameNumberView()
                    .aspectRatio(330/217, contentMode: .fit)
                Spacer()
                BottomStackButton()
            }
            .padding(.horizontal,20)
    }
}

struct BottomStackButton: View {
    var body: some View {
        HStack {
            NavigationLink (destination: MemorizeGameScreen(game: Memorize())){
                Text("미리보기").foregroundColor(.white)
            }
            Spacer()
            Button(action: {
                print("BUTTON IS SELECTED")
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.lightDark)
                        .frame(width: 80, height: 50)
                    Text("완료")
                        .foregroundColor(.white)
                }
            }
        }
    }
}


struct SelectGameNumberView: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State var selectedColor = 3
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("문제 개수").responsiveTextify(14, .bold)
                Text("범위 1~20")
                    .foregroundColor(.darkGrey)
                    .responsiveTextify(12, .medium)
            }
            VStack {
                Picker(selection: $selectedColor, label: Text("Please choose a color")) {
                    ForEach(0..<20) { index in
                        Text(String(index))
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .roundRectify(8, .leading)
        }
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
                RangeSideIndicator()
            }
            .roundRectify(8, .center)
        }
    }
}


