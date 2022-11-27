//
//  FavoriteViewController.swift
//  WeatherApp
//
//  Created by Emre Tekin on 27.11.2022.
//

import UIKit

class FavoriteViewController: BaseViewController {
    
    @IBOutlet private weak var favoriteTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
  
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
    
}
