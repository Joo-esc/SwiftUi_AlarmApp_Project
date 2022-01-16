//
//  MissionSelectSection.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/16.
//

import SwiftUI

struct MissionSelectSection: View {
    let title: String
    let canRoute: Bool
    var selectedOption: String? {
        // 선택된 게임 종류에 따라 게임 이름 값을 리턴
        get {
            switch selectedType{
            case 0:
                return "기억력 게임"
            case 1:
                return "수학 게임"
            case 2:
                return "기타1 게임"
            case 3:
                return "기타2 게임"
            default:
                return nil
            }
        }
    }
    var option: SetAlarm
    var selectedType: Int?
    var body: some View {
            ZStack {
                HStack {
                    Text(title).responsiveTextify(12, .bold)
                    Spacer()
                    NavigationLink(destination: ChooseMissionScreen(mission: Mission(), option: option)) {
                        Text(selectedOption ?? "선택안함")
                        .foregroundColor(selectedOption != nil ? .brandColor : .lightGrey)}
                        .responsiveTextify(12, .regular)
                }
                .onTapGesture {
                    print(option.missionType!)
                }
            }
        
        .padding(.horizontal, 18)
        .roundRectify(8, .leading)
        .aspectRatio(330/53, contentMode: .fit)
    }
}
