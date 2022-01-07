// MARK: MODEL
// 기상 미션을 선택하는 스크린에서 사용되는 모델
// 선택 유무 값을 store함
//
//  Created by 이해주 on 2022/01/08.


import Foundation
import SwiftUI


struct MissionModel {
    private(set) var missions: [Mission]
    
    func chooseMission(_ mission: Mission) {
        print(mission)
    }
    
    
    struct Mission: Hashable {
        let iconImg: String
        let title: String
        var isSelected = false
        let id: Int

    

    }
}


