//
//  DaySelectModal.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/18.
//

import SwiftUI

struct DaySelectModal: View {
    @Binding var showModal: Bool
    var option: SetAlarm
    var screenHeight: Double
    var week = Week()
    

    var body: some View {
        ZStack (alignment: .bottom) {
            if showModal {
                // 모달 뒷 배경 뷰
                Color.black
                    .opacity(0.3)
                    .onTapGesture {
                        withAnimation {
                            showModal = false
                        }
                    }
                modalContent
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: showModal)
    }
    
    
    // 모달 컨텐츠 내용
    var modalContent: some View {
        ZStack (alignment: .leading) {
            VStack {
                HStack {
                    EmptyView()
                    Spacer()
                    Button { showModal = false } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                    .padding(16)
                    .padding(.top, 6)
                    
                }
                // 요일 리스트 뷰
                ForEach (option.alarm.selectedDays) {item in
                    HStack {
                        Text(item.content)
                            .foregroundColor(.black)
                            .responsiveTextify(14, .regular)
                        Spacer()
                        CheckBoxView(checked: item.isSelected, item: item, option: option)
                    }
                    .padding(.horizontal, 16)
                    Rectangle()
                        .frame(height: 0.6)
                        .foregroundColor(Color.darkGrey)
                    .padding(.vertical, screenHeight * 0.01)

                }
                
                Spacer()
            }
     
        }
        .frame(height: screenHeight)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .transition(.move(edge: .bottom))
        .cornerRadius(30)
    }
}

struct CheckBoxView: View {
    @State var checked: Bool
    var item: Week.Day
    var day = Week()
    var option: SetAlarm
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color.darkBackground : Color.secondary)
            .onTapGesture {
              selectDayHandler()
            }
    }
    
    // 특정 요일을 클릭했을 때.
    func selectDayHandler() {
        self.checked.toggle()
        option.chooseDay(item)
    }
}

