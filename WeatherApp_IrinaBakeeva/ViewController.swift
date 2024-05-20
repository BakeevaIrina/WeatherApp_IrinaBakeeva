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
    private let scrollView = UIScrollView()
    
    private let bottomView = BottomView()
    private let titleView = TitleView()
    
    private let dayTemperatureView = UIView()
    private let currentWeatherView = CurrentWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupBackgroundImage()
        setupScrollView()
        setupTitleView()
        //setupCurrentWeatherView()
        setupBottomView()
    }
    
    private func setupBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "sky")
        backgroundImage.contentMode = .scaleAspectFill
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    private func setupTitleView() {
        
        scrollView.addSubview(titleView)
        titleView.backgroundColor = .clear
        
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
    
    private func setupDayWeatherView() {
        view.addSubview(dayTemperatureView)
        dayTemperatureView.addSubview(currentWeatherView)
        
        currentWeatherView.setup(
        [
            CurrentWeatherView.CurrentTemperature(labelTime: "Now", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "12a.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "1p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "2p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "3p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "4p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "5p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "6p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "7p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19),
            CurrentWeatherView.CurrentTemperature(labelTime: "8p.m", iconImage: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), labelTemperature:19)
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
