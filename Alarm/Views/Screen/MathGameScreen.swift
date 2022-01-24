//
//  MathGameScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/17.
//

import SwiftUI

struct MathGameScreen: View {
    @ObservedObject var game: Math // VM
    @Environment(\.presentationMode) var presentationMode // goBack() 로직을 실행하기 위한 설정
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkBackground.ignoresSafeArea()
                VStack {
                    GameNumIndicator(currentRound: game.currentRound, totalRound: game.totalRound)
                    ProblemIndicator(game: $game.model.mathGame, level: game.level)
                    AnswerTextField(game: game)
                    Spacer()
                    BottomDivStackButton(isDivided: false, leftTitle: nil, leftAction: goBack, rightTitle: "완료", rightAction: goBack)
                }
                .padding(.horizontal, 20)
            }.alert("기상 미션에 성공하셨습니다", isPresented: $game.isFinished) {
                // 모든 라운드를 성공적으로 진행하였을 때 보여지는 팝업 알림창
                Button("확인") {
                    goBack()
                }
            }
            .hiddenNavBarStyle()
         
        }.hiddenNavBarStyle()
    }
    
    
    // 이전 스크린으로 돌아가는 Navigation 로직
    func goBack(){
          self.presentationMode.wrappedValue.dismiss()
      }
}

// 수학 문제를 보여주는 뷰
struct ProblemIndicator: View {
    @Binding var game: Math.Math
    var level: Int
    var body: some View {
        switch level {
        case 0...2:
            Text("\(game.firstN) + \(game.secondN)").responsiveTextify(30, .bold)
        case 3:
            Text("\(game.firstN) X \(game.secondN) + \(game.thirdN!)").responsiveTextify(30, .bold)
        case 4:
            Text("\(game.firstN) X \(game.secondN) X \(game.thirdN!)").responsiveTextify(30, .bold)
        default :
            Text("값이 정확히 입력되어 있지 않습니다.").responsiveTextify(30, .bold)
        }
    }
}




// 수학 문제 답을 입력하는 뷰
struct AnswerTextField: View {
    var game: Math
    @State private var textInput = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
            HStack (alignment: .center) {
                Spacer()
                Text("=")
                TextField("", text: $textInput)
                    .onChange(of: textInput) { newValue in
                        print(newValue)
                    }
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .placeholder(when: textInput.isEmpty) {
                        Text("입력")
                            .foregroundColor(.gray)
                    }
                    .onSubmit {
                        if game.math.answer == Int(textInput)  { // 입력된 값이 정답일 때
                            textInput = "" // TextField 값 초기화
                            game.generateExpression()
                            game.increaseRound()
                        } else {
                            print("정답이 아닙닌다 ㅠㅠㅠ")
                        }
                        
                    }
                Spacer()
            }
            .padding(.horizontal, 20)
            .responsiveTextify(40, .regular)
        }
        .foregroundColor(.lightDark)
        .aspectRatio(190/70, contentMode: .fit)
        .padding(.horizontal, 32)
    }
}
