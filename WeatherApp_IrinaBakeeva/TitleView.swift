//
//  TitleView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/15/24.
//

import UIKit
import SnapKit

class TitleView: UIView {
    private let labelPlace = UILabel()
    private let lableCityName = UILabel()
    private let currentTemp = UILabel()
    private let labelWeather = UILabel()
    private let labelMaxMin = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        setupTitleView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleView() {
        
        addSubview(labelPlace)
        labelPlace.text = "Current place"
        labelPlace.textColor = .white
        labelPlace.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        
        labelPlace.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(24)
            
            addSubview(lableCityName)
            lableCityName.text = "LOS ANGELES"
            lableCityName.textColor = .white
            lableCityName.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            lableCityName.snp.makeConstraints { make in
                make.centerX.equalTo(labelPlace)
                make.top.equalTo(labelPlace).inset(50)
            }
            
            addSubview(currentTemp)
            currentTemp.text = "30°"
            currentTemp.textColor = .white
            currentTemp.font = UIFont.systemFont(ofSize: 100, weight: .semibold)
            
            currentTemp.snp.makeConstraints { make in
                make.leading.equalTo(80)
                make.top.equalTo(lableCityName).inset(16)
            }
            
            addSubview(labelWeather)
            labelWeather.text = "Clear sky"
            labelWeather.textColor = .white
            labelWeather.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            labelWeather.snp.makeConstraints { make in
                make.centerX.equalTo(lableCityName)
                make.top.equalTo(currentTemp).inset(110)
            }
            
            addSubview(labelMaxMin)
            labelMaxMin.text = "Max.: 31°, min.: 21°"
            labelMaxMin.textColor = .white
            labelMaxMin.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            labelMaxMin.snp.makeConstraints { make in
                make.centerX.equalTo(labelWeather)
                make.top.equalTo(labelWeather).inset(20)
            }
            
        }
    }
}
