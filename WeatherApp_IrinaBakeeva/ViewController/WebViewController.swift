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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webViewWeather)
        
        webViewWeather.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func open(_ url: URL) {
        webViewWeather.load(URLRequest(url: url))
    }
}
