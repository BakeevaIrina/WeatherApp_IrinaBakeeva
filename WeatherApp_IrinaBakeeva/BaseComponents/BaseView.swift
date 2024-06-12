//
//  BaseView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/2/24.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setup()
    }
    
    func setup() {}
}
