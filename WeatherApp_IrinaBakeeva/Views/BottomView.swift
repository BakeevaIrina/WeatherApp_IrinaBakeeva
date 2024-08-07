//
//  BottomView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/16/24.
//

import Foundation
import SnapKit

class BottomView: BaseView {
    private let bottomView = UIView()
    private let buttonList = UIButton()
    private let buttonMap = UIButton()
    
    var buttonAction: (() -> Void)?
    
    override func setup() {
        super.setup()
        
        backgroundColor = .bottomView
        
        setupBottomView()
        setupButtonList()
    }
    
    private func setupBottomView() {
        addSubview(bottomView)
        bottomView.backgroundColor = .bottomView
        bringSubviewToFront(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(70)
        }
        
        bottomView.addSubview(buttonMap)
        buttonMap.setImage(UIImage(systemSymbol: .map), for: .normal)
        buttonMap.tintColor = .white
        
        
        buttonMap.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.leading.equalToSuperview().inset(20)
            make.size.equalTo(40)
        }
    }
    
    private func setupButtonList() {
        bottomView.addSubview(buttonList)
        buttonList.setImage(UIImage(systemSymbol: .listBullet), for: .normal)
        buttonList.tintColor = .white
        
        buttonList.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(40)
        }
        
//        buttonList.addTarget(self, action: #selector(onButtonList), for: .touchUpInside)
        buttonList.addAction(UIAction{ _ in
            self.buttonAction?()
        }, for: .touchUpInside)
    }
    
//    @objc private func onButtonList(sender: UIButton!) {
//        let navigationController = self.window?.rootViewController as! UINavigationController
//        let controller = CityWeatherViewController()
//        navigationController.pushViewController(controller, animated: true)
//    
//    }
}

