//
//  MainScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/06.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        ZStack {
            Color.darkBackground.ignoresSafeArea()
            VStack {
                Text("hello")
            }
        }
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
