//
//  WeatherCell.swift
//  rainy-shiny-cloudy
//
//  Created by Parima Ayazi on 25/03/2018.
//  Copyright © 2018 Parima Ayazi. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        dayLabel.text = forecast._date
        weatherType.text = forecast._weatherType
        lowTemp.text = forecast.lowTemp
        highTemp.text = forecast.highTemp
        weatherIcon.image = UIImage(named: forecast.weatherType)   
    }
}
