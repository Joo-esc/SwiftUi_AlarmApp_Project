//
//  FloatingActionButton.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/06.
//

import SwiftUI

struct FloatingActionButton: View {
    var option: SetAlarm
    var body: some View {
        NavigationLink(destination: SetAlarmScreen(option: option)) {
        ZStack {
            Circle()
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(.brandColor)
                .font(.system(size: 12, weight: .ultraLight))
            }
        .foregroundColor(.black)
        .frame(width: 64, height: 64)
        }
    }
}

