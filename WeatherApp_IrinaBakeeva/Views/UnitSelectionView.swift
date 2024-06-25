//
//  UnitSelectionView.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/15/24.
//

import UIKit
import SnapKit

final class UnitSelectionView: BaseView {
    private let pickerView = UIPickerView()
    private let dataSource = [
        ["ºС", "ºF", "ºK"]
    ]
    override func setup() {
        super.setup()
        
        backgroundColor = .white
        
        addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
}
extension UnitSelectionView: UIPickerViewDataSource {
    //    Количество компонентов в pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        dataSource.count
    }
    //    Сколько вариантов в каждом компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        dataSource[component].count
    }
}

extension UnitSelectionView: UIPickerViewDelegate {
    //    Настройка внешнего вида вариантов компонента
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        dataSource[component][row]
    }
}
