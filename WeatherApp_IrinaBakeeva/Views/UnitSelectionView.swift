//
//  UnitSelectionView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/15/24.
//

import UIKit
import SnapKit

enum TempUnit: Int, CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
    
    var unitLabel: String {
        switch self {
        case .celsius: return "ºС"
        case .fahrenheit: return "ºF"
        case .kelvin: return "ºK"
        }
    }
}

protocol UnitSelectionViewDelegate: AnyObject {
    func showUnitInfo()
    func printUnit(_ unit: TempUnit)
}

final class UnitSelectionView: BaseView {
    private let pickerView = UIPickerView()
    private let infoButton = UIButton()
    
    weak var delegate: UnitSelectionViewDelegate?
    
    override func setup() {
        super.setup()
        
        backgroundColor = .darkGray
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 50
        layer.shadowOpacity = 1
        
        setupPickerView()
        setupInfoButton()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if pickerView.subviews.indices.contains(1) {
            pickerView.subviews[1].backgroundColor = .white.withAlphaComponent(0.1)
        }
    }
    
    private func setupPickerView() {
        addSubview(pickerView)
        pickerView.tintColor = .white
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(100)
            make.width.equalTo(150)
        }
    }
    
    private func setupInfoButton() {
        addSubview(infoButton)
        infoButton.setImage(UIImage(systemName: "info.circle")?.applyingSymbolConfiguration(.init(font: .systemFont(ofSize: 22))), for: .normal)
        infoButton.tintColor = .white
        infoButton.addAction(UIAction { [weak self] _ in
            self?.delegate?.showUnitInfo()
        }, for: .touchUpInside)
        
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(pickerView.snp.bottom).offset(16)
            make.bottom.trailing.equalToSuperview().inset(16)
            make.size.equalTo(25)
        }
    }
}


extension UnitSelectionView: UIPickerViewDataSource {
    //    Количество компонентов в pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    //    Сколько вариантов в каждом компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        TempUnit.allCases.count
    }
}

extension UnitSelectionView: UIPickerViewDelegate {
    //    Настройка внешнего вида вариантов компонента
    func pickerView(_ pickerView: UIPickerView, 
                    attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: TempUnit.allCases[row].unitLabel, attributes: [.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.printUnit(TempUnit.allCases[row])
    }
}
