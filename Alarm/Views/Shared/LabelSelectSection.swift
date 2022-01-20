//
//  SetAlarmScreen에서 사용되는 라벨값을 설정하는 뷰
//  + 값을 설정하기 특별히 라우팅되는 동작이 없고, 텍스트를 수정 가능한 Form으로 구성시킴.
//  Created by 이해주 on 2022/01/20.
//

import SwiftUI

struct LabelSelectSection: View {
    var option: SetAlarm
    @State var label: String?
    @State private var name = ""
    var body: some View {
        ZStack {
            HStack {
                Text("라벨").responsiveTextify(Style.textFontScale, .bold)
                Spacer()
                TextField("", text: $name)
                    .placeholder(when: name.isEmpty) {
                        Text("선택안함").foregroundColor(.gray)
                            .multilineTextAlignment(.trailing)
                    }
                    .foregroundColor(.brandColor)
                    .multilineTextAlignment(.trailing)
                    .responsiveTextify(Style.textFontScale, .regular)
            }
        }
        .padding(.horizontal, Style.hPadding)
        .roundRectify(Style.containerRadius, .leading)
        .aspectRatio(Style.containerRatio, contentMode: .fit)
    }
    
    private struct Style {
        static let textFontScale: CGFloat = 12
        static let hPadding: CGFloat = 18
        static let containerRadius: CGFloat = 8
        static let containerRatio: CGFloat = 330/53
    }
}


// PlaceHolder 익스텐션, placeHolder을 스타일 모듈
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .trailing,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

