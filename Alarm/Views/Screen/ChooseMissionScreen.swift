//
//  ChooseMissionScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct ChooseMissionScreen: View {
    var itemColumns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 100)), count: 2)
    var body: some View {
        ZStack (alignment: .leading) {
            Color.darkBackground.ignoresSafeArea()
            VStack {
                Text("미션을 선택해주세요").responsiveTextify(fontSize: 24, fontWeight: .medium)
                LazyVGrid (columns: itemColumns, spacing: 20 ) {
                    ForEach(tempArray, id: \.self) { item in
                        MissionItemView()
                    }
                    .aspectRatio(158/113, contentMode: .fit)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct MissionItemView: View {
    var body: some View {
        GeometryReader { g in
            ZStack {
                VStack (alignment: .leading) {
                    Image(systemName: "square.grid.3x3.topleft.filled")
                        .foregroundColor(.brandColor)
                        .font(.system(size: g.size.width * ItemStyle.iconScale))
                    Text("기억력 게임")
                        .responsiveTextify(fontSize: ItemStyle.titleFontSize, fontWeight: .medium)
                        .padding(.top, g.size.height * ItemStyle.paddingScale)
                    Spacer()
                }
                .padding(.vertical, ItemStyle.verticalPadding)
                .padding(.horizontal, ItemStyle.horizontalPadding)
            }
        }
        .roundRectify(conrerRadius: ItemStyle.containerRadius)
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

struct ChooseMissionScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChooseMissionScreen()
    }
}
