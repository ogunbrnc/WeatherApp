//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Ogün Birinci on 27.11.2022.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet private weak var cityTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    private func configureUI(){
            cityTextField.text = ""
            
    }
        
    @IBAction func clickButtonPressed(_ sender: Any){
        print("click button pressed")
        if cityTextField.text == "" {
            //showErrorAlert(message: "Please enter city name!")
            print("empty")
            return
        }
        guard let cityName = cityTextField.text else {
            print("nil")
            return
        }
        Client.getCurrentWeather(cityName:cityName,completion: { [weak self] weather, error in
            guard let self = self,
                  let weather = weather
            else {
                
                print(error?.localizedDescription)
                //showErrorAlert(message: "Please enter city name!")
                return
            }
            print("view")
            guard let weatherDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
                       fatalError("View Controller not found")
                   }
            weatherDetailViewController.weather = weather
            self.navigationController?.pushViewController(weatherDetailViewController, animated: true)
        })
        
        
       
        
    }

}
