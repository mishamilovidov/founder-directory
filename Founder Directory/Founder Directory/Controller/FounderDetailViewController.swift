//
//  FounderDetailViewController.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 9/29/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit
import MessageUI

class FounderDetailViewController : UITableViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    
    // MARK: - Constants
    
    private struct Storyboard {
        static let EditFounderSegueIdentifier = "EditFounder"
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var founderPhotoImageView: UIImageView!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var founderFullNameLabel: UILabel!
    @IBOutlet weak var founderCompanyLabel: UILabel!
    @IBOutlet weak var founderPreferredNameLabel: UILabel!
    @IBOutlet weak var founderSpouseNameLabel: UILabel!
    @IBOutlet weak var founderPhoneButton: UIButton!
    @IBOutlet weak var founderEmailButton: UIButton!
    @IBOutlet weak var founderBioLabel: UILabel!
    
    // MARK: - Properties
    
    var founder: Founder?
    
    // MARK: - Actions
    
    @IBAction func sendMessage(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() {
            let controller = MFMessageComposeViewController()
            
            controller.body = "Hey " + (founder?.firstName)! + "!"
            controller.recipients = [(founder?.phone)!]
            controller.messageComposeDelegate = self
            
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func callPhone(_ sender: Any) {
        guard let phoneNumber = URL(string: "tel://" + (founder?.phone)!) else { return }
        UIApplication.shared.open(phoneNumber)
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        print("send email")
        
        if MFMailComposeViewController.canSendMail() {
            let controller = MFMailComposeViewController()
            
            controller.setToRecipients([(founder?.email)!])
            controller.setSubject("Hello!")
            controller.setMessageBody("Hello this is my message body!", isHTML: false)
            controller.mailComposeDelegate = self
            
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        founderPhotoImageView.contentMode = .scaleAspectFill
        
        configure()
        tableView.reloadData()
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.EditFounderSegueIdentifier {
            
            // data for selected founder
            let editFounder = self.founder
            
            // destination view controller
            let destinationVC = (segue.destination as! UINavigationController).topViewController as! FounderEditViewController
            
            // place data in view controller
            destinationVC.founder = editFounder
            
        }
    }
    
    // MARK: - Private Helpers
    
    private func configure() {
        founderPhotoImageView.image = founder?.photo
        founderFullNameLabel.text = founder?.fullName.capitalized
        founderCompanyLabel.text = founder?.company
        founderPreferredNameLabel.text = founder?.preferredName.capitalized
        founderSpouseNameLabel.text = founder?.spouseName.capitalized
        founderPhoneButton.setTitle(Helpers.formatPhoneNumber(number: (founder?.phone)!), for: [])
        founderEmailButton.setTitle(founder?.email, for: [])
        founderBioLabel.text = founder?.bio
        
        // make image and buttons circular
        Helpers.applyCircularMaskToImageView(image: founderPhotoImageView)
        Helpers.applyCircularMaskToButton(button: messageButton)
        Helpers.applyCircularMaskToButton(button: phoneButton)
        Helpers.applyCircularMaskToButton(button: emailButton)
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            cell.isHidden = true
//        }
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Probably should refactor table to be dynamic instead of static so we don't have to manually hide certain fields

        if indexPath.row == 0 {
            return 270.0
        }
        
        if indexPath.row == 2 && founder?.phoneListed == false {
            return 0.0
        }
        
        if indexPath.row == 2 && founder?.phoneListed == true {
            return tableView.rowHeight
        }
        
        if indexPath.row == 3 && founder?.emailListed == false {
            return 0.0
        }
        
        if indexPath.row == 2 && founder?.emailListed == true {
            return tableView.rowHeight
        }
        
        if indexPath.row == 5 && founder?.spouseName.count != 0 {
            return tableView.rowHeight
        }
        
        if indexPath.row == 5 && founder?.spouseName.count == 0 {
            return 0.0
        }
        
        return tableView.rowHeight
    }
    
    // MARK: - Delegates
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Segues
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        // In this case, there is nothing to do, but we need a target (exitModalScene)
    }
    
}
