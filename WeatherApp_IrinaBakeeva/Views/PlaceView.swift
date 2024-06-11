//
//  PlaceView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/1/24.
//

import UIKit
import SnapKit

final class PlaceView: UIView{
    
    private let placeView = UIView()
    private let backgroundImage = UIImageView()
    private let labelPlace = UILabel()
    private let labelCity = UILabel()
    private let labelWeather = UILabel()
    private let currentTemp = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPlaceView()
        setupBackgroundImage()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Constants {
        static let placeText = "Current place"
        static let cityName = "Los Angeles"
        static let weatherText = "Clear sky"
        static let currentTemp = "30°"
    }
    
    private func setupPlaceView() {
        addSubview(placeView)
        
        placeView.largeContentImage = UIImage(asset: .backgroundView)
        placeView.backgroundColor = .systemGray3
        placeView.layer.cornerRadius = 10
        placeView.clipsToBounds = true
        
        placeView.snp.makeConstraints { make in
            //make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(130)
        }
        
        backgroundImage.addSubview(labelPlace)
        
        labelPlace.text = Constants.placeText
        labelPlace.textColor = .white
        labelPlace.font = UIFont.Thonburi.u25
        
        labelPlace.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
        }
        
        backgroundImage.addSubview(labelCity)
        
        labelCity.text = Constants.cityName
        labelCity.textColor = .white
        labelCity.font = UIFont.Thonburi.u16
        
        labelCity.snp.makeConstraints { make in
            make.top.equalTo(labelPlace.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
        }
        
        backgroundImage.addSubview(labelWeather)
        
        labelWeather.text = Constants.weatherText
        labelWeather.textColor = .white
        labelWeather.font = UIFont.Thonburi.u16
        
        labelWeather.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(16)
        }
        
        backgroundImage.addSubview(currentTemp)
        
        currentTemp.text = Constants.currentTemp
        currentTemp.textColor = .white
        currentTemp.font = UIFont.Thonburi.u50
        
        currentTemp.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        
    }
    
    private func setupBackgroundImage() {
        placeView.addSubview(backgroundImage)
        backgroundImage.image = UIImage(asset: .backgroundView)
        backgroundImage.contentMode = .scaleToFill
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

#Preview {
    PlaceView()
}
