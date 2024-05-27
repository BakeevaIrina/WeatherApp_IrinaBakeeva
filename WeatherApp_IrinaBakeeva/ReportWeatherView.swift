//
//  ReportWeatherView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/26/24.
//

import UIKit
import SnapKit

final class ReportWeatnerView: UIView {
    struct Temperature {
        let day: String
        let icon: String
        let minTemp: Int
        let maxTemp: Int
        
    }
    private var scrollView = UIScrollView()
    private var stackView = UIStackView()
    
    private let temperatures = [
        Temperature(day: "Today", icon: "sun.max", minTemp: 15, maxTemp: 20),
        Temperature(day: "Sun", icon: "sun.max", minTemp: 14, maxTemp: 22),
        Temperature(day: "Mon", icon: "sun.max", minTemp: 14, maxTemp: 21),
        Temperature(day: "Tue", icon: "sun.max", minTemp: 13, maxTemp: 21),
        Temperature(day: "Wed", icon: "sun.max", minTemp: 13, maxTemp: 20),
        Temperature(day: "Thu", icon: "sun.max", minTemp: 13, maxTemp: 21),
        Temperature(day: "Fri", icon: "sun.max", minTemp: 13, maxTemp: 22),
        Temperature(day: "Sat", icon: "sun.max", minTemp: 14, maxTemp: 22),
        Temperature(day: "Sun", icon: "sun.max", minTemp: 13, maxTemp: 23),
        Temperature(day: "Mon", icon: "sun.max", minTemp: 14, maxTemp: 24),
        Temperature(day: "Mon", icon: "sun.max", minTemp: 14, maxTemp: 21),
        Temperature(day: "Tue", icon: "sun.max", minTemp: 13, maxTemp: 21),
        Temperature(day: "Wed", icon: "sun.max", minTemp: 13, maxTemp: 20),
        Temperature(day: "Thu", icon: "sun.max", minTemp: 13, maxTemp: 21),
        Temperature(day: "Fri", icon: "sun.max", minTemp: 13, maxTemp: 22)
    ]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupScrollView()
        setupStackView()
        //setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            
        }
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        
    }
    
//    private func setupViews() {
//        for item in temperatures {
//            let tempView = TemperatureView()
//            tempView.setupTemperature(with: item)
//            
//            stackView.addArrangedSubview(tempView)
//            
//            tempView.snp.makeConstraints { make in
//                make.leading.equalToSuperview().offset(16)
//                make.trailing.equalToSuperview().offset(-16)
//                make.height.equalTo(50)
//                
//            }
//        }
//    }
    
}
