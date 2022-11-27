//
//  DetayVC.swift
//  WeatherApp
//
//  Created by Tolga Kağan Aysu on 27.11.2022.
//

import UIKit
import Kingfisher

final class DetayVC: UIViewController {

    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var countryNameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var wind_speedLabel: UILabel!
    @IBOutlet private weak var weatherIcons: UIImageView!
    @IBOutlet private weak var weatherDescriptions: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    private func configureUI(){
//        cityNameLabel.text
//        countryNameLabel.text
//        timeLabel.text
//        temperatureLabel.text
//        wind_speedLabel.text
//        let url = URL(string: <#T##String#>)
//        weatherIcons.kf.setImage(with: url)
        
    }
    
    @IBAction func addFavoriteButton(_ sender: Any) {
        
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        // istek
    }
}
