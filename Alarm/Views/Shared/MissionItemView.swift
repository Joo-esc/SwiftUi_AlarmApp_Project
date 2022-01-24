//
//  ChooseMission 스크린에서 사용되는 뷰
//
//  Created by 이해주 on 2022/01/24.
//

import SwiftUI

struct MissionItemView: View {
    var mission: Mission.Mission
    var selectedType: Int?
    var isSelected: Bool { // Mission 종류가 선택 유무에 따라 Boolean값을 리턴
        get {
            if mission.id == selectedType {
                return true
            } else {
                return false
            }
        }
    }
    var body: some View {
        GeometryReader { g in
            ZStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    Image(systemName: mission.iconImg)
                        .foregroundColor(.brandColor)
                        .font(.system(size: g.size.width * ItemStyle.iconScale))
                    Text(mission.title)
                        .responsiveTextify(ItemStyle.titleFontSize, .medium)
                        .padding(.top, g.size.height * ItemStyle.paddingScale)
                    Spacer()
                }
                .padding(.vertical, ItemStyle.verticalPadding)
                .padding(.horizontal, ItemStyle.horizontalPadding)
                // Line Width
                RoundedRectangle(cornerRadius: ItemStyle.containerRadius)
                    .strokeBorder(lineWidth: isSelected ? 1 : 0)
                    .foregroundColor(.brandColor)
            }
        }
        .roundRectify(ItemStyle.containerRadius, .leading)
    }
    
    private struct ItemStyle {
        static let paddingScale: CGFloat = 0.03
        static let titleFontSize: CGFloat = 16
        static let iconScale : CGFloat = 0.17
        static let verticalPadding: CGFloat = 18
        static let horizontalPadding: CGFloat = 12
        static let containerRadius: CGFloat = 20
    }
}

