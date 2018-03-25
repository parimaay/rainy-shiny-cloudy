//
//  Forecast.swift
//  rainy-shiny-cloudy
//
//  Created by Parima Ayazi on 23/03/2018.
//  Copyright © 2018 Parima Ayazi. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _lowTemp: String!
    var _highTemp: String!
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil{
            return ""
        }
        return _weatherType
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    func downloadForcastData (completed: @escaping(DownloadForecastsComplete)) {
        print("CURRENT_FORECAST_URL", CURRENT_FORECAST_URL)
        let forecastURL = URL(string: CURRENT_FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            var forecasts: Array<Forecast>! = [Forecast]()
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let allForecast = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for currForecast in allForecast {
                        
                        if let date = currForecast["dt"] as? Double {
                            let unixConvertDate = Date(timeIntervalSince1970: date)
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .full
                            dateFormatter.dateFormat = "EEEE"
                            dateFormatter.timeStyle = .none
                            self._date = unixConvertDate.dayOfTheWeek()
                        }
                        
                        if let weatherInfo = currForecast["weather"] as? [Dictionary<String, AnyObject>] {
                            if let weatherType = weatherInfo[0]["main"] as? String {
                                self._weatherType = weatherType
                            }
                        }
                        
                        if let temp = currForecast["temp"] as? Dictionary<String, AnyObject> {
                            
                            if let lowTemp = temp["min"] as? Double {
                                self._lowTemp = self.kelvinToFahrenheit(kelvin: lowTemp)
                            }
                            
                            if let highTemp = temp["max"] as? Double {
                                self._highTemp = self.kelvinToFahrenheit(kelvin: highTemp)
                            }
                        }
                        
                        let newForecast = Forecast()
                        newForecast._date = self._date
                        newForecast._weatherType = self._weatherType
                        newForecast._lowTemp = self._lowTemp
                        newForecast._highTemp = self._highTemp
                        
                        forecasts.append(newForecast)
                        
                    }
                    
                    
                }
                
            }
            forecasts.remove(at: 0)
            completed(forecasts)
        }
        
    }
    
    func kelvinToFahrenheit(kelvin: Double) -> String {
        let kelvinToFahrenheitDiv = (kelvin * (9/5) - 459.67)
        let kelvinToFahrenheit = Double(round(10 * kelvinToFahrenheitDiv/10))
        return "\(kelvinToFahrenheit)"
    }
  
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

