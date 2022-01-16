//
//  MemorizeGameView.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetMemorizeGameScreen: View {
    var setOption = SetAlarm()
    @Environment(\.presentationMode) var presentationMode // goBack() 로직을 실행하기 위한 설정
    var body: some View {
            VStack (alignment: .leading){
                Text("설정")
                    .responsiveTextify(Style.titleScale, .medium)
                    .onTapGesture {
                    }
                Text("기억력 게임")
                    .foregroundColor(.darkGrey)
                    .responsiveTextify(Style.subTitleScale, .medium)
                    .padding(.bottom, Style.sectionPadding)
                SelectDifficultyView()
                    .aspectRatio(Style.rangeBox1, contentMode: .fit)
                    .padding(.bottom, Style.sectionPadding)
                SelectGameNumberView()
                    .aspectRatio(Style.rangeBox2, contentMode: .fit)
                Spacer()
                BottomStackButton(goBack: goBack)
            }
            .padding(.horizontal,Style.bottomPadding)
    }
    
    // 이전 스크린으로 돌아가는 Navigation 로직
    func goBack(){
          self.presentationMode.wrappedValue.dismiss()
      }
    
    private struct Style {
        static let titleScale: CGFloat = 24
        static let subTitleScale: CGFloat = 16
        static let sectionPadding: CGFloat = 40
        static let rangeBox1: CGFloat = 330/177
        static let rangeBox2: CGFloat = 330/217
        static let bottomPadding: CGFloat = 20
        
    }
}



struct SelectGameNumberView: View {
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

struct BottomStackButton: View {
    var goBack: () -> Void
    var body: some View {
        HStack {
            NavigationLink (destination: MemorizeGameScreen(game: Memorize(length: 2, totalRound: 2, countDonwTime: 60))  ){
                Text("미리보기").foregroundColor(.white)
            }
            Spacer()
            Button(action: {
                goBack()
                print("AIM")
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

