//
//  UIFont+Typography.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/10/24.
//

import UIKit

extension UIFont {
    enum Thonburi {
        static let u16 = UIFont(name: "Thonburi", size: 16)
        static let u25 = UIFont(name: "Thonburi", size: 25)
        static let u50 = UIFont(name: "Thonburi", size: 50)
        
    }
    
    enum Italic {
        static let u20 = UIFont.italicSystemFont(ofSize: 20)
    }
    
    enum SystemFont {
        static let u16 = UIFont.systemFont(ofSize: 16, weight: .semibold)
        static let u18 = UIFont.systemFont(ofSize: 18, weight: .semibold)
        static let u20 = UIFont.systemFont(ofSize: 20, weight: .semibold)
        static let u40 = UIFont.systemFont(ofSize: 40, weight: .semibold)
        static let u100 = UIFont.systemFont(ofSize: 100, weight: .semibold)
    }
    
}
