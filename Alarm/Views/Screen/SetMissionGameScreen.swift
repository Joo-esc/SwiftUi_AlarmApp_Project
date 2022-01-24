//
// '기억력 게임' & '수학 게임'의 미션의 옵션을 값을 설정하는 스크린
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct SetMissionGameScreen: View {
    let gameName: String
    let selectedType: Int
    @State var option: SetAlarm
    
    @Environment(\.presentationMode) var presentationMode // goBack() 로직을 실행하기 위한 설정
    var body: some View {
            VStack (alignment: .leading){
                Text("설정")
                    .responsiveTextify(Style.titleScale, .medium)
                Text(gameName)
                    .foregroundColor(.darkGrey)
                    .responsiveTextify(Style.subTitleScale, .medium)
                    .padding(.bottom, Style.sectionPadding)
                SelectDifficultyView(
                    selectedType: selectedType,
                    selectedLevel: option.alarm.level ?? 1.0, option: option)
                    .aspectRatio(Style.rangeBox1, contentMode: .fit)
                    .padding(.bottom, Style.sectionPadding)
                SelectGameNumberView(selectedRound: Int(option.alarm.round ?? 4), option: option)
                    .aspectRatio(Style.rangeBox2, contentMode: .fit)
                Spacer()

                BottomStackButton(
                    selectedType: selectedType,
                    goBack: goBack, option: option, setOptions: completeFunc)
            }
            .padding(.horizontal,Style.bottomPadding)
    }
    
    // 이전 스크린으로 돌아가는 Navigation 로직
    func goBack(){
          self.presentationMode.wrappedValue.dismiss()
      }
    
    // 변경된 State을 최정적으로 Store하는 로직, '완료 버튼 클릭 시' 
    func completeFunc() {
        option.alarm.missionType = selectedType
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



// 문제 개수를 설정하는 뷰
struct SelectGameNumberView: View {
    @State var selectedRound: Int
    var option: SetAlarm
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("문제 개수").responsiveTextify(14, .bold)
                Text("범위 1~20")
                    .foregroundColor(.darkGrey)
                    .responsiveTextify(12, .medium)
            }
            VStack {
                Picker(selection: $selectedRound, label: Text("")) {
                    ForEach(0..<20) { index in
                        Text(String(index))
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: selectedRound, perform: { newValue in
                    option.alarm.round = Double(newValue)
                })
            }
            .roundRectify(8, .leading)
        }
    }
}


// 하단 고정 버튼
struct BottomStackButton: View {
    let selectedType: Int
    var goBack: () -> Void
    @State var option: SetAlarm
    let setOptions: () -> Void
    var body: some View {
        HStack {
            // 게임 미션 종류에 따라 라우트되는 스크린이 다름.
            if selectedType == 0 {
                NavigationLink (destination:  MemorizeGameScreen(game: Memorize(length: option.alarm.level ?? 1 , totalRound: Int(option.alarm.round ?? 3), countDonwTime: 60))) {
                    Text("미리보기").foregroundColor(.white)
                }
            } else {
                NavigationLink (destination: MathGameScreen(game: Math(totalRound: Int(option.alarm.round ?? 3), level: Int(option.alarm.level ?? 1)))) {
                    Text("미리보기").foregroundColor(.white)
                }
            }

            Spacer()
            Button(action: {
                setOptions()
                goBack()
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

