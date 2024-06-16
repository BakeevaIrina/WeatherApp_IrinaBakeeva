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
    private let unitSelectionView = UnitSelectionView()
    private let showHideButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundCity
        
        setupTitleLabel()
        setupTextField()
        setupPlaceView()
        setupUnitSelectionView()
        setupShowHideButton()
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
    
    private func setupUnitSelectionView() {
        view.addSubview(unitSelectionView)
        
        unitSelectionView.backgroundColor = .darkBlue
        unitSelectionView.isHidden = true
        
        unitSelectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
    }
    
    private func setupShowHideButton() {
        view.addSubview(showHideButton)
        
        showHideButton.backgroundColor = .systemBlue
        showHideButton.layer.cornerRadius = 5
        showHideButton.setTitle("Show UnitSelectionView", for: .normal)
        
        
        
        showHideButton.snp.makeConstraints { make in
            make.top.equalTo(unitSelectionView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        showHideButton.addAction(UIAction { [weak self] _ in
            guard let self else { return }
            
            unitSelectionView.isHidden.toggle()
            
            let buttonTitle = unitSelectionView.isHidden ? "Show UnitSelection" : "Hide UnitSelection"
            showHideButton.setTitle(buttonTitle, for: .normal)
        }, for: .touchUpInside)
    }
}

#Preview {
    CityWeatherViewController()
}
