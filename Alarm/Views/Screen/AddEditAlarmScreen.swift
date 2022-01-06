//
//  AddEditAlarmScreen.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/07.
//

import SwiftUI

struct AddEditAlarmScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkBackground.ignoresSafeArea()
                VStack {
                    TimeSelectView()
                        .aspectRatio(330/181, contentMode: .fit)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .hiddenNavBarStyle()
        }
    }
}

struct TimeSelectView: View {
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 8)
        ZStack {
            shape
            VStack (alignment: .leading) {
                HStack () {
                    Spacer()
                    Image(systemName: "clock")
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                    Text("지금으로부터 6시간 24분 후에 올림").responsiveTextify(fontSize: 14, fontWeight: .regular)
                    Spacer()
                }
                .padding(.vertical, 14)
                Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
                Spacer()
                
            }
        }
        .foregroundColor(.lightDark)
    }
}


struct AddEditAlarmScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddEditAlarmScreen()
    }
}
