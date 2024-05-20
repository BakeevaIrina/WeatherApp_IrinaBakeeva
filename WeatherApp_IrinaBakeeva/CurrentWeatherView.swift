//
//  TimeWeatherView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/17/24.
//

import UIKit
import SnapKit

final class CurrentWeatherView: UIView {
    struct CurrentTemperature{
        let labelTime: String
        let iconImage: UIImage?
        let labelTemperature: Int
    }
    
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupScrollView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup (_ models: [CurrentTemperature]) {
        //перечисляем все модели с их индексами в массиве
        models.enumerated().forEach { index, model  in
            //создаем новое представление TimeWeaterView
            let view = TimeWeatherView()
            //настраиваем новое представление с использование модели
            view.setup(model)
            //добавляем новое представление в stackView
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
       // scrollView.backgroundColor = .white
        
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
        
        func setup(_ model: CurrentTemperature) {
            // Устанавливаем текст метки времени на значение, переданное из модели
            hourLabel.text = model.labelTime
            //Устанавливаем изображение в предоставлении иконки из модели
            iconView.image = model.iconImage
            //Устанавливаем текст метки температуры на значение из модели
            tempLabel.text = "\(model.labelTemperature)º"
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
            hourLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            hourLabel.textAlignment = .center
            hourLabel.textColor = .white
        }
        
        private func setupIconView() {
            stackView.addArrangedSubview(iconView)
            iconView.contentMode = .scaleAspectFill
        }
        
        private func setupTempLabel() {
            stackView.addArrangedSubview(tempLabel)
            tempLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            tempLabel.textAlignment = .center
            tempLabel.textColor = .white
        }
    }
}

