//  MARK: VIEW MODEL
//  Created by 이해주 on 2022/01/08.

import SwiftUI

class Mission {
    typealias Mission = MissionModel.Mission
    static let missionList = [Mission(iconImg:  "square.grid.3x3.topleft.filled", title: "기억력 게임", id: 0), Mission(iconImg: "plus.forwardslash.minus", title: "계산 게임", id: 1), Mission(iconImg: "circle.slash", title: "준비중1", id: 2), Mission(iconImg: "circle.slash", title: "준비중2", id: 3)]
    
    private(set) var model : MissionModel = MissionModel(missions: missionList)
    
    var missions: [Mission] {
        model.missions
    }
}

