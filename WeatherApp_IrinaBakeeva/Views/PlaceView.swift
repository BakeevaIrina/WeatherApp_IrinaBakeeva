//
//  PlaceView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/1/24.
//

import UIKit
import SnapKit

extension PlaceView {
    struct InputModel {
        let title: String
        let subtitle: String?
        let currentTemp: Int
        let description: String
        let minTemp: Int
        let maxTemp: Int
    }
}

final class PlaceView: BaseView {
    private let backgroundImage = UIImageView()
    private let labelPlace = UILabel()
    private let subtitleLabel = UILabel()
    private let labelWeather = UILabel()
    private let currentTemp = UILabel()
    private let limitTemp = UILabel()
    
    var tapAction: (() -> Void)?
    
    override func setup() {
        super.setup()
        
        snp.makeConstraints { make in
            make.height.equalTo(125)
        }
        
        setupBackgroundImage()
        setupCurrentTemp()
        setupLimitTemp()
        setupLabelPlace()
        setupSubtitleLabel()
        setupLabelWeather()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGestureAction)))
    }
    @IBAction private func tapGestureAction() { // TODO: - Remove after implement collection
        tapAction?()
    }
    
    func setup(_ model: InputModel) {
        labelPlace.text = model.title
        subtitleLabel.text = model.subtitle
        subtitleLabel.isHidden = model.subtitle == nil
        currentTemp.text = "\(model.currentTemp)"
        labelWeather.text = model.description
        limitTemp.text = "Max: \(model.maxTemp)º, min: \(model.minTemp)º"

    }
    
    private func setupBackgroundImage() {
        addSubview(backgroundImage)
        
        backgroundImage.image = UIImage(asset: .backgroundView)
        backgroundImage.layer.cornerRadius = 10
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.clipsToBounds = true
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func setupCurrentTemp() {
        addSubview(currentTemp)
    
        currentTemp.textColor = .white
        currentTemp.font = UIFont.Thonburi.u50
        currentTemp.textAlignment = .right
        
        currentTemp.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupLimitTemp() {
        addSubview(limitTemp)
        
        limitTemp.font = UIFont.Thonburi.u16
        limitTemp.textColor = .white
        limitTemp.textAlignment = .right
        
        limitTemp.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupLabelPlace() {
        addSubview(labelPlace)
        
        labelPlace.textColor = .white
        labelPlace.font = UIFont.Thonburi.u25
        
        labelPlace.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(currentTemp.snp.leading).offset(-20)
        }
    }
    
    private func setupSubtitleLabel() {
        addSubview(subtitleLabel)
        
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont.Thonburi.u16
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(labelPlace.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(16)
        }
    }
    
    private func setupLabelWeather() {
        addSubview(labelWeather)
        
        labelWeather.textColor = .white
        labelWeather.font = UIFont.Thonburi.u16
        labelWeather.numberOfLines = 2
        
        labelWeather.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(16)
            make.trailing.equalTo(limitTemp.snp.leading).offset(-20)
        }
    }
   
}
    


