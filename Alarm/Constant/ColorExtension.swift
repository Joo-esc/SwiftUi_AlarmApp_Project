// MARK: Color pallate
// 헥스 코드를 가진 문자열을 입력받아 RGB값을 추출해 Color타입의 인스턴스 생성

import SwiftUI

extension Color {
    static let darkBackground = Color(hex: "111114")
    static let lightDark = Color(hex: "34344A")
    static let brandColor = Color(hex: "F0F757")
    static let lightGrey = Color(hex: "9D9D9B")
    static let darkGrey = Color(hex: "9D9D9B")
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        // #이 있다면 제거
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        // 문자열로부터 RGB값 추출
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}





