//
//  BottomView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/16/24.
//

import Foundation
import SnapKit

class BottomView: UIView {
    private let bottomView = UIView()
    private let buttonList = UIButton()
    private let buttonMap = UIButton()
    
    var action: (() -> Void)?
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "bottomView")
        
        setupBottomView()
        setupButtonList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBottomView() {
        addSubview(bottomView)
        bottomView.backgroundColor = UIColor(named: "bottomView")
        bringSubviewToFront(bottomView)
        
        bottomView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.height.equalTo(70)
        }
        
        bottomView.addSubview(buttonMap)
        buttonMap.setImage(UIImage(systemName: "map"), for: .normal)
        buttonMap.tintColor = .white
        
        
        buttonMap.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.leading.equalToSuperview().inset(20)
            make.size.equalTo(40)
        }
    }
    
    private func setupButtonList() {
        bottomView.addSubview(buttonList)
        buttonList.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        buttonList.tintColor = .white

        
        buttonList.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(40)
        }
        
        buttonList.addTarget(self, action: #selector(onButtonList), for: .touchUpInside)
    }
    
    @objc private func onButtonList() {
        let navigationController = self.window?.rootViewController as! UINavigationController
        let controller = CityWeatherViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}

