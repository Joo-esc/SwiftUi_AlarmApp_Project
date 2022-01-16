//
//  OtherGameScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/17.
//

import SwiftUI

struct OtherGameScreen: View {
    @Environment(\.presentationMode) var presentationMode // goBack() 로직을 실행하기 위한 설정
    var body: some View {
        VStack (alignment:.center) {
            Text("준비중 입니다.").responsiveTextify(20, .bold)
            Spacer()
            BottomDivStackButton(isDivided: false, leftTitle: nil, leftAction: goBack, rightTitle: "취소", rightAction: goBack)
        }

    }
    // 이전 스크린으로 돌아가는 Navigation 로직
    func goBack(){
        self.presentationMode.wrappedValue.dismiss()
    }
}
