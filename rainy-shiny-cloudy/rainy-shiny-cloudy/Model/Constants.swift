//
//  Constants.swift
//  rainy-shiny-cloudy
//
//  Created by Parima Ayazi on 20/03/2018.
//  Copyright © 2018 Parima Ayazi. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let CONT = "&cnt=10"
let APP_ID = "&appid="
let API_KEY = "2aab40544100f21e8a9d530ceb9be253"
let CURR_LATITUDE = "\(Location.sharedInstance.latitude ?? 0.0)"
let CURR_LONGITUDE = "\(Location.sharedInstance.longitude ?? 0.0)"


let CURRENT_WEATHER_URL = "\(BASE_URL)weather?\(LATITUDE)\(CURR_LATITUDE)\(LONGITUDE)\(CURR_LONGITUDE)\(APP_ID)\(API_KEY)"
let CURRENT_FORECAST_URL = "\(BASE_URL)forecast/daily?\(LATITUDE)\(CURR_LATITUDE)\(LONGITUDE)\(CURR_LONGITUDE)\(CONT)\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()
typealias DownloadForecastsComplete = (Array<Forecast>) -> ()

