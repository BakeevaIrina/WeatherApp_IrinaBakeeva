//
//  TimeWeatherView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/17/24.
//

import UIKit
import SnapKit

extension CurrentWeatherView {
    struct InputModel{
        let time: String
        let icon: UIImage?
        let temp: Int
    }
}

final class CurrentWeatherView: BaseView {
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    override func setup(){
        super.setup()
        
        setupScrollView()
        setupStackView()
    }
    
    func setup (_ models: [InputModel]) {
        //перечисляем все модели с их индексами в массиве
        models.enumerated().forEach { index, model  in
            let view = TimeWeatherView()
            view.setup(model)
            stackView.addArrangedSubview(view)
            //устанавливаем пользовательский доступ только после первого представления
            if index == 0 {
                stackView.setCustomSpacing(35, after: view)
            }
        }
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CurrentWeatherView {
    final class TimeWeatherView: UIView {
        
        private let stackView = UIStackView()
        private let hourLabel = UILabel()
        private let iconView = UIImageView()
        private let tempLabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupHourLabel()
            setupIconView()
            setupTempLabel()
            setupStackView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup(_ model: InputModel) {
            // Устанавливаем текст метки времени на значение, переданное из модели
            hourLabel.text = model.time
            //Устанавливаем изображение в предоставлении иконки из модели
            iconView.image = model.icon
            //Устанавливаем текст метки температуры на значение из модели
            tempLabel.text = "\(model.temp)º"
        }
        
        private func setupStackView() {
            addSubview(stackView)
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.distribution = .fillEqually
            
            stackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        private func setupHourLabel() {
            stackView.addArrangedSubview(hourLabel)
            hourLabel.font = UIFont.SystemFont.u16
            hourLabel.textAlignment = .center
            hourLabel.textColor = .white
        }
        
        private func setupIconView() {
            stackView.addArrangedSubview(iconView)
            iconView.contentMode = .scaleAspectFill
        }
        
        private func setupTempLabel() {
            stackView.addArrangedSubview(tempLabel)
            tempLabel.font = UIFont.SystemFont.u18
            tempLabel.textAlignment = .center
            tempLabel.textColor = .white
        }
    }
}

