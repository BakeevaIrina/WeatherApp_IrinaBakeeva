//
//  DetailedWeatherViewController.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/28/24.
//

import UIKit
import SnapKit
import SafariServices
import WebKit

final class DetailedWeatherViewController: BaseViewController {
    private enum Constants {
        static let titleBarText = "Weather condition"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .bcDetails
        
        setupCloseButton()
    
        
        let iconView = UIImageView(image: UIImage(systemSymbol: .cloudSunFill)?.withTintColor(.white, renderingMode: .alwaysOriginal))
        let label = UILabel()
        label.text = Constants.titleBarText
        label.textColor = .white
        
        let titleStackView = UIStackView(arrangedSubviews: [iconView, label])
        titleStackView.spacing = 6
        
        navigationItem.titleView = titleStackView
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupCloseButton() {
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemSymbol: .closeButton)?.withTintColor(.gray, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(closeAction))
        
    }
    @IBAction private func closeAction() {
        dismiss(animated: true)
    }
}
