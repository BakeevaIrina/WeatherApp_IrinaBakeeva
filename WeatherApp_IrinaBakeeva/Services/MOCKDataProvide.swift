//
//  MOCKDataProvide.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 7/8/24.
//

import UIKit

typealias TitleData = TitleView.InputModel
typealias CurrentWeather = CurrentWeatherView.InputModel
typealias ReportWeather = ReportWeatherView.Temperature

struct MOCKData {
    let titleData: TitleData
    let currentTemp: (description: String, data: [CurrentWeather])
    let reportWeather: [ReportWeather]
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
                maxTemp: 21),
                     currentTemp: (description: "Sunny",
                                   data: [
                                    CurrentWeather(
                                        time: "Now",
                                        icon: UIImage(systemName: "cloud.heavyrain")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "12PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "1PM",
                                        icon: UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "2PM",
                                        icon: UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "3PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "4PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "5PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "6PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "7PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "8PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                   ]
                                  ),
                     
                     reportWeather: [
                        ReportWeather(
                            day: "Today",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "SUN",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "MON",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "TUE",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "WEN",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "THU",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "FRI",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "SAT",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "SUN",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "MON",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                     ]),
            
            MOCKData(titleData: TitleData(
                title: "LONDON",
                subtitle: "",
                currentTemp: 20,
                description: "Windy",
                minTemp: 15,
                maxTemp: 25),
                     currentTemp: ("Rain",
                                   data: [
                                    CurrentWeather(
                                        time: "Now",
                                        icon: UIImage(systemName: "cloud.heavyrain")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "12PM",
                                        icon: UIImage(systemName: "cloud.sun.bolt.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "1PM",
                                        icon: UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "2PM",
                                        icon: UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "3PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "4PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "5PM",
                                        icon: UIImage(systemName: "cloud.sun.bolt.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "6PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "7PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                    CurrentWeather(
                                        time: "8PM",
                                        icon: UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal),
                                        temp: 19),
                                   ]),
                     reportWeather: [
                        ReportWeather(
                            day: "Today",
                            icon: "cloud.sun",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "SUN",
                            icon: "cloud.sun.bolt.fill",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "MON",
                            icon: "cloud.sun",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "TUE",
                            icon: "cloud.sun",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "WEN",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "THU",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "FRI",
                            icon: "cloud.sun",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "SAT",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "SUN",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                        ReportWeather(
                            day: "MON",
                            icon: "sum.max",
                            minTempWeek: 10,
                            maxTempWeek: 30,
                            minDayTemp: 15,
                            maxDayTemp: 20,
                            currentTemp: 17),
                     ])
        ]
    }
}
