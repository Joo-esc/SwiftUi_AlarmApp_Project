//
// SetAlarmScreen에서 사용되는 요일 옵션 선택 뷰
//
//  Created by 이해주 on 2022/01/20.
//

import SwiftUI

struct DaySelectSection: View {
    var option: SetAlarm
    var weekList: [Week.Day]
    var selectedDays: String? {
        get { filteredDays() }
    }
    let showModal: () -> Void

    var body: some View {
        ZStack {
            HStack {
                Text("반복").responsiveTextify(Style.textFontScale, .bold)
                Spacer()
                Text(selectedDays ?? "선택안함")
                    .foregroundColor(selectedDays != nil ? .brandColor : .lightGrey)
                    .responsiveTextify(Style.textFontScale, .regular)
            }
        }
        .padding(.horizontal, Style.hPadding)
        .roundRectify(Style.containerRadius, .leading)
        .aspectRatio(Style.containerRatio, contentMode: .fit)
        .onTapGesture {
            showModal()
        }
    }
    
    // 선택된 요일을 필터링 하는 로직. 선택된 값이 없을 경우 nil값을 리턴
    func filteredDays() -> String? {
        let selectedIndicies = weekList.indices.filter{weekList[$0].isSelected}
        if selectedIndicies.count > 0 {
            var tempList: [String] = []
            for index in selectedIndicies {
                tempList.append(weekList[index].content)
            }
            let filtered = tempList.joined(separator: ", ")
            return filtered
        } else {
            return nil
        }
    }
    
    private struct Style {
        static let textFontScale: CGFloat = 12
        static let hPadding: CGFloat = 18
        static let containerRadius: CGFloat = 8
        static let containerRatio: CGFloat = 330/53
    }
}
