//
//  FavoriteWeatherViewController.swift
//  WeatherApp
//
//  Created by Emre Tekin on 27.11.2022.
//

import UIKit

class FavoriteWeatherViewController: UIViewController {
    @IBOutlet private weak var favoriteTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension FavoriteWeatherViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
    
}
