//
//  ReportWeatherView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/28/24.
//

import UIKit
import SnapKit

final class ReportWeatherView: UIView {
    struct Temperature {
        let day: String
        let icon: String
        let minTempWeek: Double
        let maxTempWeek: Double
        let minDayTemp: Double
        let maxDayTemp: Double
        let currentTemp: Double
    }
    
    private var scrollView = UIScrollView()
    private var stackView = UIStackView()
    
    private let temperatures = [
        Temperature(day: "Today", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 15, maxDayTemp: 20, currentTemp: 17),
        Temperature(day: "Sun", icon: "cloud", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 14, maxDayTemp: 22, currentTemp: 15),
        Temperature(day: "Mon", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 14, maxDayTemp: 21, currentTemp: 18),
        Temperature(day: "Tue", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 21, currentTemp: 14),
        Temperature(day: "Wed", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 20, currentTemp: 20),
        Temperature(day: "Thu", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 21, currentTemp: 14),
        Temperature(day: "Fri", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 22, currentTemp: 21),
        Temperature(day: "Sat", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 14, maxDayTemp: 22, currentTemp: 16),
        Temperature(day: "Sun", icon: "cloud", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 23, currentTemp: 15),
        Temperature(day: "Mon", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 14, maxDayTemp: 24, currentTemp: 15),
        Temperature(day: "Mon", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 14, maxDayTemp: 21, currentTemp: 15),
        Temperature(day: "Tue", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 21, currentTemp: 15),
        Temperature(day: "Wed", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 20, currentTemp: 15),
        Temperature(day: "Thu", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 21, currentTemp: 15),
        Temperature(day: "Fri", icon: "sun.max", minTempWeek: 10, maxTempWeek: 30, minDayTemp: 13, maxDayTemp: 22, currentTemp: 15)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupScrollView()
        setupStackView()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func setupViews() {
        
        for item in temperatures {
            let tempView = TemperatureView()
            tempView.setupTemperature(with: item)
            
            stackView.addArrangedSubview(tempView)
            
            tempView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.height.equalTo(50)
                
            }
        }
    }
    
    final class TemperatureView: BaseView {
        private let dayLabel = UILabel()
        private let iconImage = UIImageView()
        private let minTempLabel = UILabel()
        private let mediumTemp = MediumTempDayView()
        private let maxTempLabel = UILabel()
        
        private let topBorderView = UIView()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupElements()
            backgroundColor = .blue
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        func setupTemperature(with day: Temperature) {
            
            dayLabel.text = day.day
            dayLabel.textColor = .white
            dayLabel.font = UIFont.SystemFont.u20
            
            iconImage.image = UIImage(systemSymbol: .sunMax)
            iconImage.tintColor = .darkYellow
            iconImage.contentMode = .scaleAspectFit
            
            minTempLabel.text = "\(Int(day.minDayTemp))"
            minTempLabel.textColor = .white
            minTempLabel.font = UIFont.SystemFont.u20
            
            mediumTemp.setup(
                MediumTempDayView.InputModel(minWeekTemp: (day.minTempWeek),
                                             maxWeekTemp: day.maxTempWeek,
                                             minDayTemp: day.minDayTemp,
                                             maxDayTemp: day.maxDayTemp,
                                             currentTemp: day.currentTemp)
            )
            
            
            maxTempLabel.text = "\(Int(day.maxDayTemp))"
            maxTempLabel.textColor = .white
            maxTempLabel.font = UIFont.SystemFont.u20
            
            topBorderView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        }
        
        private func setupElements() {
            addSubview(dayLabel)
            addSubview(iconImage)
            addSubview(minTempLabel)
            addSubview(mediumTemp)
            addSubview(maxTempLabel)
            
            addSubview(topBorderView)
            
            dayLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().inset(5)
            }
            
            iconImage.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().inset(85)
            }
            
            minTempLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalTo(iconImage.snp.trailing).inset(-16)
            }
            
            mediumTemp.snp.makeConstraints { make in
                make.leading.equalTo(minTempLabel.snp.trailing).offset(10)
                make.trailing.equalTo(maxTempLabel.snp.leading).offset(-10)
                make.centerY.equalToSuperview()
            }
            
            maxTempLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalTo(minTempLabel.snp.trailing).offset(150)
            }
            
            topBorderView.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
                make.height.equalTo(1)
                make.width.equalTo(330)
            }
        }
    }
}
