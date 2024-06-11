//
//  CityWeatherViewController.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/28/24.
//

import UIKit
import SnapKit

final class CityWeatherViewController: UIViewController {
    private let titleLabel = UILabel()
    private let textField = UISearchTextField()
    private let placeView = PlaceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundCity
        
        setupTitleLabel()
        setupTextField()
        setupPlaceView()
    }
    private enum Constants {
        static let titleText = "Weather"
        static let textPlaceholder = " Search city or airport"
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = Constants.titleText
        titleLabel.textColor = .white
        titleLabel.font = UIFont.Thonburi.u25
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.equalToSuperview().inset(16)
            
        }
    }
    
    private func setupTextField() {
        view.addSubview(textField)
        
        textField.backgroundColor = .searchTextField
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray, // Цвет текста
            .font: UIFont.Italic.u20 // Шрифт
        ]
        let placeholder = NSAttributedString(string: Constants.textPlaceholder, attributes: attributes)
        textField.attributedPlaceholder = placeholder
        textField.leftView = UIImageView(image: UIImage(systemSymbol: .magnifyingglass))
        textField.leftView?.tintColor = UIColor.systemGray
        textField.leftViewMode = .always
        textField.rightView = UIImageView(image: UIImage(systemSymbol: .listBullet))
        textField.rightView?.tintColor = UIColor.systemGray
        textField.rightViewMode = .always
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-5)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
    }
    
    private func setupPlaceView() {
        view.addSubview(placeView)
        
        placeView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
    }
}




#Preview {
    CityWeatherViewController()
}
