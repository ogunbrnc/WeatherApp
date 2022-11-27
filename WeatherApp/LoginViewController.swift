//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ogün Birinci on 27.11.2022.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet private weak var cityTextField: UILabel!

    override func viewDidLoad() {
        configureUI()
        
    }
    
    private func configureUI(){
        cityTextField.text = ""
        
    }
    
    @IBAction func clickButtonPressed(_ sender: Any){
        if cityTextField.text == "" {
            showErrorAlert(message: "Please enter city name!", completion: nil)
                
            }
        
    }


}

