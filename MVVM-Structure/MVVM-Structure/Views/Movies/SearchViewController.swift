//
//  SearchViewController.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation
import UIKit
import Combine

class MovieTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: MovieTableViewCell.self)
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    private var viewModel: MovieViewModel!
    
    func fill(with viewModel: MovieViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.releaseDate
        imageview.image = viewModel.posterImagePath?.toImage()
    }
    
    
    
    
}
            
extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: MovieViewModel!
    
    let searchViewController = UISearchController(searchResultsController: nil)
    
    let clientID        = "9cvmCRUerq0EaIDJWwAl"    // ClientID
    let clientSecret    = "W26r__k9A9"              // ClientSecret

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchViewController
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier, for: indexPath) as! MovieTableViewCell
        let info = viewModel.getInfo(at: indexPath.row)
        cell.update(info: info)
        return cell
    }
    
    
}
