//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Nicola Lasagni on 20/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func renderWeatherCell(forecast: Forecast) {
        dayLabel.text = forecast.date
        weatherImage.image = UIImage(named: forecast.weatherType)
        weatherLabel.text = forecast.weatherType
        maxTempLabel.text = forecast.highTemp
        minTempLabel.text = forecast.lowTemp
    }

}
