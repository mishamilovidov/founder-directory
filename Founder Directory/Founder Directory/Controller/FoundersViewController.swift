//
//  FounderViewController.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 9/29/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class FounderTableViewCell : UITableViewCell{
    
    // MARK: - Outlets
    @IBOutlet weak var founderImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
}

class FoundersViewController : UITableViewController {
    
    // MARK: - Constants
    
    private struct Storyboard {
        static let FounderCellIdentifier = "FounderCell"
        static let ShowFounderSegueIdentifier = "ShowFounder"
    }
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    var selectedFounderFullName : String?
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialIndexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: initialIndexPath, animated: true, scrollPosition:UITableViewScrollPosition.none)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.performSegue(withIdentifier: Storyboard.ShowFounderSegueIdentifier, sender: initialIndexPath)
        }
        
        setupNavBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFounder" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                // data for selected founder
                let founder = FounderDirectory.sharedInstance.founderSet[indexPath.row]
                
                // destination view controller
                let destinationVC = (segue.destination as! UINavigationController).topViewController as! FounderDetailViewController
                
                // place data in view controller
                destinationVC.founder = founder
                
            }
        }
    }
    
    // MARK: - Private Helpers
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 126/255, green: 191/255, blue: 75/255, alpha: 1.0)
        
    }
    
    private func styleImageView(image: UIImageView) {
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
    // MARK: - Data Source Model Association
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FounderDirectory.sharedInstance.founderSet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.FounderCellIdentifier, for: indexPath) as! FounderTableViewCell
        let image = FounderDirectory.sharedInstance.founderSet[indexPath.row].photo
        let fullName = "\(FounderDirectory.sharedInstance.founderSet[indexPath.row].fullName.capitalized)"
        let company = "\(FounderDirectory.sharedInstance.founderSet[indexPath.row].company.capitalized)"
        
        cell.founderImageView?.image = image
        cell.fullNameLabel?.text = fullName
        cell.companyLabel?.text = company
        
        // make image circular
        styleImageView(image: (cell.founderImageView)!)
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
}

