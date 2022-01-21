//
//  ChooseMissionScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/08.
//

import SwiftUI

struct ChooseMissionScreen: View {
    private(set) var mission: Mission
    var option: SetAlarm
    @Environment(\.presentationMode) var presentationMode // goBack() 로직을 실행하기 위한 설정
    var itemColumns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 100)), count: 2)
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkBackground.ignoresSafeArea()
               
                    VStack(alignment: .leading) {
                        Text("미션을 선택해주세요").responsiveTextify(ScreenStyle.titleFontSize, .medium)
                        LazyVGrid (columns: itemColumns, spacing: ScreenStyle.gridSpacing ) {
                            ForEach(mission.missions, id:\.self) { item in
                                NavigationLink (destination: SetMissionDetailScreen( option: option, id: item.id).hiddenNavBarStyle
                                ){
                                    MissionItemView(mission: item, selectedType: option.alarm.missionType)
                                }
                            }
                            .aspectRatio(ScreenStyle.itemGridRation, contentMode: .fit)
                        }
                        Spacer()
                        BottomDivStackButton(isDivided: true, leftTitle: "선택안함", leftAction: cancel, rightTitle: "완료", rightAction: goBack)
                    }
                    .padding(.horizontal, 20)
                
            }.hiddenNavBarStyle()
        }.navigationBarBackButtonHidden(true)
    }
    
    
    func cancel() {
        option.alarm.missionType = nil
        goBack()
    }
    
    // 이전 스크린으로 돌아가는 Navigation 로직
    func goBack() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    private struct ScreenStyle {
        static let titleFontSize: CGFloat = 24
        static let gridSpacing: CGFloat = 20
        static let itemGridRation: CGFloat = 158/113
    }
}

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


