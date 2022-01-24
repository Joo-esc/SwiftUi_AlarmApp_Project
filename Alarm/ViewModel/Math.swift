//
//  Math.swift
//  Alarm
//
//  Created by 이해주 on 2022/01/24.
//

import SwiftUI

class Math: ObservableObject {
    typealias Math = MathModel.MathGame
    
    @Published private(set) var currentRound: Int = 1
    @Published private(set) var totalRound:Int
    let level: Int
    @Published var model: MathModel
    
    var math: Math {
        model.mathGame
    }
    
    init(totalRound: Int, level: Int) {
        self.totalRound = totalRound
        self.level = level
        self.model = MathModel(level: level)
    }
    
    func generateExpression() {
        model.generateExpression(level: level)
    }
}
