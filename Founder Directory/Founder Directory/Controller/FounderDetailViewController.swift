//
//  FounderDetailViewController.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 9/29/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class FounderDetailViewController : UIViewController {
    
    // MARK: - Properties
    
    var founder: String?
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Segues
    
    @IBAction func showFounderDetails(_ segue: UIStoryboardSegue) {
        if let selectedFounder = founder {
            title = selectedFounder
        }
    }
    
}
