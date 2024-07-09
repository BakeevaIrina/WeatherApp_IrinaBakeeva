//
//  TitleView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/15/24.
//

import UIKit
import SnapKit

extension TitleView {
    struct InputModel {
        let title: String
        let subtitle: String?
        let currentTemp: Int
        let description: String
        let minTemp: Int
        let maxTemp: Int
    }
}

final class TitleView: UIView {
    private let stackView = UIStackView()
    private let labelPlace = UILabel()
    private let labelCityName = UILabel()
    private let currentTemp = UILabel()
    private let labelWeather = UILabel()
    private let labelMaxMin = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setupTitleView()
        setupStackView()
        setupTitleLabel()
        setupLabelCityName()
        setupCurrenTemp()
        setupWeatherLabel()
        setupTemperatureLimit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ model: InputModel) {
        labelPlace.text = model.title
        labelCityName.text = model.subtitle
        labelCityName.isHidden = model.subtitle == nil
        currentTemp.text = "\(model.currentTemp)º"
        labelWeather.text = model.description
        labelMaxMin.text = "Max: \(model.maxTemp)º, min: \(model.minTemp)º"
         
        
        
    }
    
//    private enum Constants {
//        static let titleText = "Current place"
//        static let cityNameText = "LOS ANGELES"
//        static let tempText = "30°"
//        static let weatherText = "Clear sky"
//        static let maxMinText = "Max.: 31°, min.: 21°"
//    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(labelPlace)
        labelPlace.font = UIFont.SystemFont.u40
        labelPlace.textAlignment = .center
        labelPlace.textColor = .white
    }
    
    private func setupLabelCityName() {
        stackView.addArrangedSubview(labelCityName)
        labelCityName.font = UIFont.Thonburi.u16
        labelCityName.textAlignment = .center
        labelCityName.textColor = .white
    }
    
    private func setupCurrenTemp() {
        stackView.addArrangedSubview(currentTemp)
        currentTemp.font = UIFont.SystemFont.u100
        currentTemp.textAlignment = .center
        currentTemp.textColor = .white
    }
    
    private func setupWeatherLabel() {
        stackView.addArrangedSubview(labelWeather)
        labelWeather.font = UIFont.SystemFont.u16
        labelWeather.textAlignment = .center
        labelWeather.textColor = .white
    }
    
    private func setupTemperatureLimit() {
        stackView.addArrangedSubview(labelMaxMin)
        labelMaxMin.font = UIFont.SystemFont.u16
        labelMaxMin.textAlignment = .center
        labelMaxMin.textColor = .white
    }
    
//    private func setupTitleView() {
//        
//        addSubview(labelPlace)
//        labelPlace.text = Constants.titleText
//        labelPlace.textColor = .white
//        labelPlace.font = UIFont.SystemFont.u40
//        
//        labelPlace.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(24)
//            
//            addSubview(lableCityName)
//            lableCityName.text = Constants.cityNameText
//            lableCityName.textColor = .white
//            lableCityName.font = UIFont.Thonburi.u16
//            
//            lableCityName.snp.makeConstraints { make in
//                make.centerX.equalTo(labelPlace)
//                make.top.equalTo(labelPlace).inset(50)
//            }
            
//            addSubview(currentTemp)
//            currentTemp.text = Constants.tempText
//            currentTemp.textColor = .white
//            currentTemp.font = UIFont.SystemFont.u100
//            
//            currentTemp.snp.makeConstraints { make in
//                make.leading.equalTo(80)
//                make.top.equalTo(lableCityName).inset(16)
//            }
//            
//            addSubview(labelWeather)
//            labelWeather.text = Constants.weatherText
//            labelWeather.textColor = .white
//            labelWeather.font = UIFont.SystemFont.u16
//            
//            labelWeather.snp.makeConstraints { make in
//                make.centerX.equalTo(lableCityName)
//                make.top.equalTo(currentTemp).inset(110)
//            }
            
//            addSubview(labelMaxMin)
//            labelMaxMin.text = Constants.maxMinText
//            labelMaxMin.textColor = .white
//            labelMaxMin.font = UIFont.SystemFont.u16
//            
//            labelMaxMin.snp.makeConstraints { make in
//                make.centerX.equalTo(labelWeather)
//                make.top.equalTo(labelWeather).inset(20)
//            }
            
//        }
//    }
}
