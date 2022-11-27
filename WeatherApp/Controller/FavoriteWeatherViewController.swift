//
//  FavoriteWeatherViewController.swift
//  WeatherApp
//
//  Created by Emre Tekin on 27.11.2022.
//

import UIKit

class FavoriteWeatherViewController: UIViewController {
    @IBOutlet private weak var favoriteTableView: UITableView!
    var weathers: [CoreDataWeather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        weathers = CoreDataManager.shared.getNotes()
        print(weathers)
        configureTableView()

        // Do any additional setup after loading the view.
    }
    
    private func configureTableView() {
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        favoriteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        favoriteTableView.estimatedRowHeight = UITableView.automaticDimension
    }

}

extension FavoriteWeatherViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let weatherDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
                   fatalError("View Controller not found")
               }
        self.navigationController?.pushViewController(weatherDetailViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = weathers[indexPath.row].name! + " : " + String(weathers[indexPath.row].temperature)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
    }
}
