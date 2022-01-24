//
//  MathGameScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/17.
//

import SwiftUI

struct MathGameScreen: View {
    @ObservedObject var game = Math(totalRound: 4, level: 0)
    var body: some View {
        ZStack {
            Color.darkBackground.ignoresSafeArea()
            VStack {
                GameNumIndicator(currentRound: game.currentRound, totalRound: game.totalRound)
                ProblemIndicator(game: $game.model.mathGame, level: game.level)
                AnswerTextField()
                Text("AIM").responsiveTextify(20, .bold)
                    .onTapGesture {
                        game.generateExpression()
                        print(game.math.firstN)
                    }
                    
                Text(String(game.math.firstN)).responsiveTextify(14, .bold)
                Text(String(game.math.secondN)).responsiveTextify(14, .bold)
                Spacer()
            }
        }

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
                        print("submit")
                        print(textInput)
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
