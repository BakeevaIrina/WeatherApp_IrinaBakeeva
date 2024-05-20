//
//  ViewController.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let backgroundImage = UIImageView()
    private let containerView = UIView()
    private let titleView = TitleView()
    private let bottomView = BottomView()

    private let dayTemperatureView = UIView()
    private let currentWeatherView = CurrentWeatherView()
    //private let scrollView = UIScrollView()
    
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
        //setupCurrentWeatherView()
        //setupScrollView()
    }
    
    private func setupBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "sky")
        backgroundImage.contentMode = .scaleAspectFill
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
//    private func setupScrollView() {
//        view.addSubview(scrollView)
//        
//        scrollView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
//        
//    }
    
    private func setupContainerView() {
        view.addSubview(containerView)
        //containerView.backgroundColor = .white
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(containerView.snp.width).multipliedBy(0.7)
        }
    }
    
    private func setupTitleView() {
        
        containerView.addSubview(titleView)
        //titleView.backgroundColor = .red
        
        titleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(250)
        }
    }
    
//    private func setupCurrentWeatherView() {
//        view.addSubview(currentWeatherView)
//        currentWeatherView.backgroundColor = .black
//
//        currentWeatherView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(316)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(-16)
//            make.height.equalTo(100)
//
//        }
//    }
    
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
            make.top.equalTo(containerView.snp.bottom).inset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(130)
        }
        
    }
    
    private func setupDayWeatherView() {
        view.addSubview(dayTemperatureView)
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
    ViewController()
}
