//
//  WeatherViewController
//  WeatherApp
//
//  Created by Nicola Lasagni on 18/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var todayTempLabel: UILabel!
    @IBOutlet weak var todayWeatherLabel: UILabel!
    @IBOutlet weak var todayWeatherImage: UIImageView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var forecastTableView: UITableView!
    
    let weatherService = WeatherService()
    var forecastArray = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        
        weatherService.downloadWeatherDetails { (currentWeather: CurrentWeather) in
            self.renderCurrentWeather(currentWeather: currentWeather)
        }
        weatherService.downloadForecast { (forecastArray: [Forecast]) in
            self.forecastArray = forecastArray
            self.forecastTableView.reloadData()
        }

    }
    
    func renderCurrentWeather(currentWeather: CurrentWeather) {
        todayDateLabel.text = currentWeather.date
        todayTempLabel.text = currentWeather.currentTemp
        todayWeatherLabel.text = currentWeather.weatherType
        positionLabel.text = currentWeather.cityName
        todayWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = forecastTableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell {
            let forecast = self.forecastArray[indexPath.row]
            cell.renderWeatherCell(forecast: forecast)
            return cell
        } else {
            return WeatherTableViewCell()
        }
    }
    

}

