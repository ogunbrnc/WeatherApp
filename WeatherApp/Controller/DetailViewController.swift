//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Tolga Kağan Aysu on 27.11.2022.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {

    var weather: Weather?
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var wind_speedLabel: UILabel!
    @IBOutlet private weak var weatherIcons: UIImageView!
    @IBOutlet private weak var weatherDescriptions: UILabel!
       
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let addFavoriteButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addFavoriteButton))
            let refreshButton = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshButton))
            navigationItem.rightBarButtonItems = [addFavoriteButton,refreshButton]

            configureUI()
          
        }
    
    
        
    func configureUI(){
        guard let weather = weather else {
            return
        }
        cityNameLabel.text = weather.location.name
        countryNameLabel.text = weather.location.country
        timeLabel.text = weather.current.observationTime
        temperatureLabel.text = String(weather.current.temperature)
        wind_speedLabel.text = String(weather.current.windSpeed)
        weatherDescriptions.text = weather.current.weatherDescriptions[0]
        let url = URL(string: weather.current.weatherIcons[0])
        weatherIcons.kf.setImage(with: url)
        
    }
    
    @objc func addFavoriteButton(_ sender: Any) {
        CoreDataManager.shared.saveNote(model: CoreDataModel(temperature: (weather?.current.temperature)!,
                                                             wind: (weather?.current.windSpeed)!,
                                                             icon: (weather?.current.weatherIcons)!,
                                                             name: (weather?.location.name)!,
                                                             time: (weather?.current.observationTime)!,
                                                             weatherDescription: (weather?.current.weatherDescriptions)!))
        
    }
    
    @objc func refreshButton(_ sender: Any) {
        Client.getCurrentWeather(cityName:(weather?.location.name)!,completion: { [weak self] weather, error in
            guard let self = self,
                  let weather = weather
            else {
                print(error?.localizedDescription)
                //showErrorAlert(message: "Please enter city name!")
                return
            }
            self.weather = weather
            self.configureUI()
        })
    }
}
