//
//  WebViewController.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/23/24.
//

import UIKit
import SnapKit
import WebKit

final class WebViewController: UIViewController {
    private let webViewWeather = WKWebView()
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupNavigationBar()
        setupWebViewWeather()
        setupCloseButton()
        
        
        title = "Info"
        
        webViewWeather.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private enum Constants {
        static let title = "Info"
    }
    func open(_ url: URL) {
        webViewWeather.load(URLRequest(url: url))
    }
    private func setupNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.barStyle = .black
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
    
    private func setupWebViewWeather() {
        view.addSubview(webViewWeather)
        webViewWeather.backgroundColor = .clear
        
        webViewWeather.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
}

