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

final class TitleView: BaseView {
    private let stackView = UIStackView()
    private let labelPlace = UILabel()
    private let labelCityName = UILabel()
    private let currentTemp = UILabel()
    private let labelWeather = UILabel()
    private let labelMaxMin = UILabel()
    
    override func setup() {
        super.setup()
        
        setupStackView()
        setupTitleLabel()
        setupLabelCityName()
        setupCurrenTemp()
        setupWeatherLabel()
        setupTemperatureLimit()
    }
    
    func setup(_ model: InputModel) {
        labelPlace.text = model.title
        labelCityName.text = model.subtitle
        labelCityName.isHidden = model.subtitle == nil
        currentTemp.text = "\(model.currentTemp)"
        labelWeather.text = model.description
        labelMaxMin.text = "Max: \(model.maxTemp)º, min: \(model.minTemp)º"
    }
    
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
        labelPlace.numberOfLines = 2
    }
    
    private func setupTemperatureLimit() {
        stackView.addArrangedSubview(labelMaxMin)
        labelMaxMin.font = UIFont.SystemFont.u16
        labelMaxMin.textAlignment = .center
        labelMaxMin.textColor = .white
    }
}
