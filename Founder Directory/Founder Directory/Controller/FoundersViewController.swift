//
//  FounderViewController.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 9/29/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class FoundersViewController : UITableViewController {
    
    // MARK: - Constants
    
    private struct Storyboard {
        static let FounderCellIdentifier = "FounderCell"
    }
    
    // MARK: - Properties
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - Data Source Model Association
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FounderDirectory.sharedInstance.fullnameSet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.FounderCellIdentifier)!
        let image = UIImage(named: "\(FounderDirectory.sharedInstance.photoSet[indexPath.row])")
        
        cell.textLabel?.text = FounderDirectory.sharedInstance.fullnameSet[indexPath.row].capitalized
        cell.detailTextLabel?.text = FounderDirectory.sharedInstance.companySet[indexPath.row].capitalized
        cell.imageView?.image = image
        
        // make image circular
        cell.imageView?.layer.cornerRadius = (image?.size.width)!/2
        cell.imageView?.layer.masksToBounds = true;
        cell.imageView?.layer.borderWidth = 0;
        cell.imageView?.transform.translatedBy(x: 0.5, y: 0.5)//.scaledBy(x: 0.5, y: 0.5)
        
        return cell
    }
    
    // MARK: - Table View Delegate
}

