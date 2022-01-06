//
//  DayOfWeekList.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/06.
//

import SwiftUI



struct WeekItemModifier: ViewModifier  {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        VStack {
            Circle()
                .frame(width: 4, height: 4)
                .foregroundColor(Color.brandColor)
                .opacity(isSelected ? 1 : 0)
            content
                .foregroundColor(isSelected ? Color.brandColor : Color.lightGrey)
        }
    }
}

extension View {
    func weekItemModifier(isSelected: Bool) -> some View {
        modifier(WeekItemModifier(isSelected: isSelected))
    }
}

