//
//  UIImage+Assets.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 6/10/24.
//

import UIKit

extension UIImage {
    convenience init?(asset: AssetIndentifier) {
        self.init(named: asset.rawValue)
    }
}

enum AssetIndentifier: String {
    case backgroundView = "sky"
}

extension UIImage {
    convenience init?(systemSymbol: SFSymbolIdentifier) {
    self.init(systemName: systemSymbol.rawValue)
    }
}

enum SFSymbolIdentifier: String {
    case sunMax = "sun.max.fill"
    case cloud = "cloud"
    case magnifyingglass = "magnifyingglass"
    case listBullet = "list.bullet"
    case map = "map"
}
