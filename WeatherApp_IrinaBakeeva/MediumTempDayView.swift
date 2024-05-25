//
//  MediumTempDayView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/20/24.
//

import UIKit
import SnapKit

final class MediumTempDayView: UIView {
    struct InputModel {
        let minWeekTemp: Double
        let maxWeekTemp: Double
        let minDayTemp: Double
        let maxDayTemp: Double
        let currentTemp: Double?
    }
    
    private let mediumTempDayView = UIView()
    private let currentTempView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "darkBlue")?.withAlphaComponent(0.5)
        layer.cornerRadius = 3
        
        snp.makeConstraints { make in
            make.height.equalTo(6)
        }
        setupMediumTempDayView()
        setupCurrentTempView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ model: InputModel) {
        let weekTempDiff = model.maxWeekTemp - model.minWeekTemp
        //        Рассчитывается относительное смещение для минимальной/ дневной температуры относительно минимальной недельной температуры.
        let minOffSet = abs(model.minWeekTemp - model.minDayTemp) / weekTempDiff
        let maxOffSet = abs(model.maxWeekTemp - model.maxDayTemp) / weekTempDiff
        
        mediumTempDayView.snp.remakeConstraints { make in
            make.trailing.equalToSuperview().multipliedBy(1 - maxOffSet)
            make.width.equalToSuperview().multipliedBy(1 - minOffSet - maxOffSet)
            make.height.equalToSuperview()
        }
        //        Проверяется, существует ли текущая температура в модели.
        if let currentTemp = model.currentTemp {
            //            Рассчитывается относительное смещение для текущей температуры относительно минимальной недельной температуры.
            let currentTempOffSet = abs(model.maxWeekTemp - currentTemp) / weekTempDiff
            
            if currentTempOffSet == 0 {
                currentTempView.snp.remakeConstraints { make in
                    make.centerX.equalTo(snp.leading)
                    make.size.equalTo(snp.height)
                }
            } else {
                currentTempView.snp.remakeConstraints { make in
                    make.centerX.equalTo(snp.trailing).multipliedBy(currentTempOffSet)
                    make.size.equalTo(snp.height)
                }
            }
        }
    }
    
    private func setupMediumTempDayView() {
        addSubview(mediumTempDayView)
        
        mediumTempDayView.backgroundColor = UIColor(named: "darkYellow" )
        mediumTempDayView.layer.borderColor = UIColor(named: "darkBlue")?.withAlphaComponent(0.7).cgColor
        mediumTempDayView.layer.borderWidth = 1
        mediumTempDayView.layer.cornerRadius = 3
        
        mediumTempDayView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    private func setupCurrentTempView() {
        addSubview(currentTempView)

        currentTempView.backgroundColor = .white
        currentTempView.layer.borderColor = UIColor(named: "darkBlue")?.withAlphaComponent(0.7).cgColor
        currentTempView.layer.borderWidth = 1
        currentTempView.layer.cornerRadius = 3

        currentTempView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(snp.height)
        }
    }
}

