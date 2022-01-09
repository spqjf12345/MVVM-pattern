//
//  SearchViewController.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MovieViewModel!
    
    let searchViewController = UISearchController(searchResultsController: nil)
    
    let clientID        = "9cvmCRUerq0EaIDJWwAl"    // ClientID
    let clientSecret    = "W26r__k9A9"              // ClientSecret
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MovieViewModel()
        navigationItem.searchController = searchViewController
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        return cell
    }
    
    
}
