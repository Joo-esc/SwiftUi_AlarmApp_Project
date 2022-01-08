// MARK: BUSINESS LOGIC
//  시간 입력받아 설정된 알람 시간으로부터 남은 시간을 반환하는 Operator
//  계산된 시간 차가 24시간이 넘어갈 경우 (계산된 시간이 '음수'일 경우) 24시간을 더하여 시간을 더함
//  Created by hj.lee on 2022/01/07.


import SwiftUI

struct RemainTime : View {
    private let endDate:Date = Date()
    @Binding var startDate: Date
    
    func computeTime(startDate: Date) -> DateComponents {
        let diffComponents = Calendar.current.dateComponents([.hour, .minute], from: endDate, to: startDate)
        let hours = diffComponents.hour
        let minutes = diffComponents.minute
        
        var selectedDate: Date = startDate
        // 만약
        if diffComponents.hour! < 0 || diffComponents.minute! < 0 {
            var futureDate = Calendar.current.date(byAdding: .day, value: 1, to: endDate)
            
            futureDate = Calendar.current.date(byAdding: .hour, value: hours!, to: futureDate!)
            futureDate = Calendar.current.date(byAdding: .minute, value: minutes!, to: futureDate!)
            
            selectedDate = futureDate!
        }
        return Calendar.current.dateComponents([.hour, .minute], from: endDate, to: selectedDate)
    }
    
    var body: some View {
        Text("지금으로부터 \(computeTime(startDate:startDate).hour!)시간 \(computeTime(startDate:startDate).minute!)분 후에 울림")
            .responsiveTextify(14, .regular)
    }
}

//struct ComputeDateDistance: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}


