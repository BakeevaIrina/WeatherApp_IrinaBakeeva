//
//  ViewController.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/11/24.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private let backgroundImage = UIImageView()
    private let containerView = UIView()
    private let titleView = TitleView()
    private let bottomView = BottomView()

    private let dayTemperatureView = UIView()
    private let mediumTempDayView = MediumTempDayView()
    private let currentWeatherView = CurrentWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupBackgroundImage()
        setupContainerView()
        setupTitleView()
        setupBottomView()
        
        setupDayTemperatureView()
        setupDayTemperatureView()
        setupDayWeatherView()

    }
    
    private func setupBackgroundImage() {
        
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "sky")
        backgroundImage.contentMode = .scaleAspectFill
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupContainerView() {
        
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(containerView.snp.width).multipliedBy(0.7)
        }
    }
    
    private func setupTitleView() {
        
        containerView.addSubview(titleView)

        titleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(250)
        }
    }
  
    private func setupBottomView() {
        
        view.addSubview(bottomView)
        bottomView.backgroundColor = UIColor(named: "bottomView")
        view.bringSubviewToFront(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(70)
        }
    }
    
    private func setupDayTemperatureView() {
        
        view.addSubview(dayTemperatureView)
        dayTemperatureView.backgroundColor = UIColor(named: "bottomView")
        dayTemperatureView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        dayTemperatureView.layer.borderWidth = 1
        dayTemperatureView.layer.cornerRadius = 15
        
        dayTemperatureView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(130)
        }
        
    }
    
    private func setupDayWeatherView() {
        view.addSubview(dayTemperatureView)
        dayTemperatureView.addSubview(mediumTempDayView)
        
        mediumTempDayView.snp.makeConstraints { make in
            
        }
        
        
        dayTemperatureView.addSubview(currentWeatherView)
        
        currentWeatherView.setup(
        [
            CurrentWeatherView.CurrentTemperature(labelTime: "Now", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "12AM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "1PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "2PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "3PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "4PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "5PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "6PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "7PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "8PM", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19)
        ]
    )
        currentWeatherView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.bottom.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
    }
 
}
#Preview {
    WeatherViewController()
}
