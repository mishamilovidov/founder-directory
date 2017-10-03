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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        configure()
        
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
    
    func setupNavBar() {
    }
    
    
    // MARK: - Private Helpers
    
    private func configure() {
        founderPhotoImageView.image = UIImage(named: (founder?.photo)!)
        founderFullNameLabel.text = founder?.fullName.capitalized
        founderCompanyLabel.text = founder?.company.capitalized
        founderPreferredNameLabel.text = founder?.preferredName.capitalized
        founderSpouseNameLabel.text = founder?.spouseName.capitalized
        founderPhoneButton.setTitle(formattedNumber(number: (founder?.phone)!), for: [])
        founderEmailButton.setTitle(founder?.email, for: [])
        founderBioLabel.text = founder?.bio
        
        // make image and buttons circular
        styleImageView(image: founderPhotoImageView)
        styleButton(button: messageButton)
        styleButton(button: phoneButton)
        styleButton(button: emailButton)
    }
    
    private func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var mask = "(XXX) XXX-XXXX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask.characters {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    private func styleButton(button: UIButton) {
        button.layer.cornerRadius = button.frame.height/2
        button.clipsToBounds = true
    }
    
    private func styleImageView(image: UIImageView) {
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
