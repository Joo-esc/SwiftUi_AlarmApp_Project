//
//  ChooseMissionScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct ChooseMissionScreen: View {
    private(set) var mission: Mission
    var itemColumns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 100)), count: 2)
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkBackground.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("미션을 선택해주세요").responsiveTextify(ScreenStyle.titleFontSize, .medium)
                        LazyVGrid (columns: itemColumns, spacing: ScreenStyle.gridSpacing ) {
                            ForEach(mission.missions, id:\.self) { item in
                                NavigationLink (destination: SetMissionDetailScreen(id: item.id).hiddenNavBarStyle
                                ){
                                    MissionItemView(mission: item)
                                }
                            }
                            .aspectRatio(ScreenStyle.itemGridRation, contentMode: .fit)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
            }.hiddenNavBarStyle()
        }.navigationBarBackButtonHidden(true)
    }
    private struct ScreenStyle {
        static let titleFontSize: CGFloat = 24
        static let gridSpacing: CGFloat = 20
        static let itemGridRation: CGFloat = 158/113
    }
}

struct MissionItemView: View {
    var mission: Mission.Mission
    var body: some View {
        GeometryReader { g in
            ZStack {
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


