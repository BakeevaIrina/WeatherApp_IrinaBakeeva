//
//  ViewController.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/11/24.
//

import UIKit
import SnapKit

final class WeatherViewController: BaseViewController {
    private enum Constants {
        static let buttonShowTitle = "Show details"
    }
    
    private let backgroundImage = UIImageView()
    private let containerView = UIView()
    private let titleView = TitleView()
    private let bottomView = BottomView()
    private let topBorderView = UIView()
    private let buttonShowDetails = UIButton()
    
    private let dayTemperatureView = UIView()
    private let mediumTempDayView = MediumTempDayView()
    private let currentWeatherView = CurrentWeatherView()
    private let reportWeatherView = ReportWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupBackgroundImage()
        setupContainerView()
        setupTitleView()
        setupBottomView()
        setupTopBorderView()
        
        setupDayTemperatureView()
        setupDayTemperatureView()
        setupDayWeatherView()
        setupReportWeatherView()
//        setupButtonShowDetails()
        
        
    }
    
    private func setupBackgroundImage() {
        
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(asset: .backgroundView)
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
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(250)
        }
    }
    
    private func setupBottomView() {
        view.addSubview(bottomView)
        
        bottomView.backgroundColor = .bottomView
        view.bringSubviewToFront(bottomView)
        bottomView.buttonAction = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(70)
        }
    }
    
    private func setupTopBorderView() {
        bottomView.addSubview(topBorderView)
        
        topBorderView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
        topBorderView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(bottomView)
            make.height.equalTo(1)
        }
    }
    
    private func setupDayTemperatureView() {
        
        view.addSubview(dayTemperatureView)
        dayTemperatureView.backgroundColor = .bottomView
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
        

        dayTemperatureView.addSubview(currentWeatherView)
        
        currentWeatherView.setup(
            [
                CurrentWeatherView.InputModel(time: "Now", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "12AM", icon: UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "1PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "2PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "3PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "4PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "5PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "6PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "7PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19),
                CurrentWeatherView.InputModel(time: "8PM", icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal), temp:19)
            ]
        )
        currentWeatherView.snp.makeConstraints { make in
            make.top.equalTo(dayTemperatureView).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
    }
    
//    private func setupButtonShowDetails() {
//        view.addSubview(buttonShowDetails)
//        
//        buttonShowDetails.setTitle(Constants.buttonShowTitle, for: .normal)
//        buttonShowDetails.backgroundColor = .darkBlue
//        buttonShowDetails.layer.cornerRadius = 5
//        buttonShowDetails.addAction(UIAction { _ in
//            let detailedWeatherViewController = DetailedWeatherViewController()
//            let navigationContriller = UINavigationController(rootViewController: detailedWeatherViewController)
//            self.present(navigationContriller, animated: true)
//        }, for: .touchUpInside)
//        
//        
//        buttonShowDetails.snp.makeConstraints { make in
//            make.top.equalTo(currentWeatherView.snp.bottom).offset(16)
//            make.horizontalEdges.equalToSuperview().inset(16)
//            make.height.equalTo(50)
//        }
//    }

    private func setupReportWeatherView() {
        
        view.addSubview(reportWeatherView)
        reportWeatherView.backgroundColor = UIColor(named: "bottomView")
        reportWeatherView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        reportWeatherView.layer.borderWidth = 1
        reportWeatherView.layer.cornerRadius = 15
        view.bringSubviewToFront(bottomView)
        
        
        reportWeatherView.snp.makeConstraints { make in
            make.top.equalTo(currentWeatherView.snp.bottom).inset(-25)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom )
        }
    }
    
    func setup(_ data: MOCKData) {
        titleView.setup(data.titleData)
    }

}

extension WeatherViewController: UISearchBarDelegate {
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarBookmarkButtonClicked")
    }
}

