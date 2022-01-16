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
    var selectedOption: String?
    var body: some View {
            ZStack {
                HStack {
                    Text(title).responsiveTextify(12, .bold)
                    Spacer()
                    NavigationLink(destination: ChooseMissionScreen(mission: Mission())) {
                        Text(selectedOption ?? "선택안함")
                        .foregroundColor(selectedOption != nil ? .brandColor : .lightGrey)}
                        .responsiveTextify(12, .regular)
                }
            }
        
        .padding(.horizontal, 18)
        .roundRectify(8, .leading)
        .aspectRatio(330/53, contentMode: .fit)
    }
}
