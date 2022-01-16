//
//  HideNavBarModifier.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/07.
//

import SwiftUI

struct HiddenNavBarStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline).navigationBarHidden(true)
          
       
    }
}

extension View {
    func hiddenNavBarStyle() -> some View {
        modifier(HiddenNavBarStyle())
    }
}

