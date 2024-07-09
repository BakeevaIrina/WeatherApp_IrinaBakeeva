//
//  MOCKDataProvide.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 7/8/24.
//

import UIKit

typealias TitleData = TitleView.InputModel

struct MOCKData {
    let titleData: TitleData
}

extension MOCKData {
    static var data: [MOCKData] {
        return [
            MOCKData(titleData: TitleData(
                title: "Current place",
                subtitle: "LOS ANGELES",
                currentTemp: 30,
                description: "Clear sky",
                minTemp: 31,
                maxTemp: 21)
            ),
            
            MOCKData(titleData: TitleData(
                title: "LONDON",
                subtitle: "",
                currentTemp: 20,
                description: "Windy",
                minTemp: 15,
                maxTemp: 25))
        ]
    }
}
