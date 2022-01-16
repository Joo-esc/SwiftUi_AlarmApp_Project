//
//  하단에 고정되어 있는 버튼. 특정 동작과 컨텐츠를 전달 받음.
//
//  Created by 이해주 on 2022/01/17.
//

import SwiftUI

struct BottomDivStackButton: View {
    let isDivided: Bool
    let leftTitle: String?
    let leftAction: () -> Void?
    let rightTitle: String
    let rightAction: () -> Void
    
    var body: some View {
        HStack {
            // 두 개의 버튼을 가지고 있을 시
            if isDivided {
                  Button  {
                    leftAction()
                } label: {
                    Text(leftTitle!).responsiveTextify(14, .bold)
                }
            }
            Spacer()
            Button {
                rightAction()
            } label: {
                ZStack {
                    Text(rightTitle).responsiveTextify(14, .bold)
                }
                .roundRectify(32, .center)
                .frame(width: 82, height: 50, alignment: .center)
            }
        }
    }
}


