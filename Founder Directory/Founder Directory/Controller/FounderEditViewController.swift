//
//  FounderEditViewController.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 10/1/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class EditFounderTableViewCell : UITableViewCell {}

class FounderEditViewController : UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // MARK: - Constants
    
    private struct Storyboard {
        static let ExitSegueIdentifier = "ExitModal"
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var editFounderImageView: UIImageView!
    @IBOutlet weak var editFounderImageButton: UIButton!
    @IBOutlet weak var editFounderFirstName: UITextField!
    @IBOutlet weak var editFounderLastName: UITextField!
    @IBOutlet weak var editFounderPreferredName: UITextField!
    @IBOutlet weak var editFounderCompany: UITextField!
    @IBOutlet weak var editFounderSpouse: UITextField!
    @IBOutlet weak var editFounderPhone: UITextField!
    @IBOutlet weak var editFounderEmail: UITextField!
    @IBOutlet weak var editFounderBio: UITextView!
    @IBOutlet weak var listFounderEmailSwitch: UISwitch!
    @IBOutlet weak var listFounderPhoneSwitch: UISwitch!
    
    // MARK: - Properties
    
    var founder: Founder?
    let imagePicker = UIImagePickerController()
    
    // MARK: - Actions
    
    @IBAction func doneEditingFounder(_ sender: Any) {
        editFounderFirstName.resignFirstResponder()
        editFounderLastName.resignFirstResponder()
        editFounderPreferredName.resignFirstResponder()
        editFounderCompany.resignFirstResponder()
        editFounderSpouse.resignFirstResponder()
        editFounderPhone.resignFirstResponder()
        editFounderEmail.resignFirstResponder()
        editFounderBio.resignFirstResponder()
        
        saveDetails()
        
        performSegue(withIdentifier: Storyboard.ExitSegueIdentifier, sender: sender)
    }
    
    @IBAction func editFounderImage(_ sender: Any) {
        let picker = UIImagePickerController()
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        picker.delegate = self
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            action in
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        imagePicker.delegate = self
        editFounderImageView.contentMode = .scaleAspectFill
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func configure() {
        editFounderImageView.image = founder?.photo
        editFounderFirstName.text = founder?.firstName
        editFounderLastName.text = founder?.lastName
        editFounderPreferredName.text = founder?.preferredName
        editFounderCompany.text = founder?.company
        editFounderSpouse.text = founder?.spouseName
        editFounderPhone.text = Helpers.formatPhoneNumber(number: (founder?.phone)!)
        editFounderEmail.text = founder?.email
        editFounderBio.text = founder?.bio
        listFounderEmailSwitch.isOn = (founder?.emailListed)!
        listFounderPhoneSwitch.isOn = (founder?.phoneListed)!
        
        // make image and button circular
        Helpers.applyCircularMaskToImageView(image: editFounderImageView)
        Helpers.applyCircularMaskToButton(button: editFounderImageButton)
    }
    
    // MARK: - Private Helpers
    
    private func saveDetails() {
        founder?.photo = editFounderImageView.image!
        founder?.firstName = editFounderFirstName.text!
        founder?.lastName = editFounderLastName.text!
        founder?.fullName = Helpers.setFullName(firstName: editFounderFirstName.text!, lastName: editFounderLastName.text!)
        founder?.preferredName = editFounderPreferredName.text!
        founder?.company = editFounderCompany.text!
        founder?.spouseName = editFounderSpouse.text!
        founder?.phone = editFounderPhone.text!
        founder?.email = editFounderEmail.text!
        founder?.bio = editFounderBio.text!
        founder?.emailListed = listFounderEmailSwitch.isOn
        founder?.phoneListed = listFounderPhoneSwitch.isOn
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editFounderFirstName.resignFirstResponder()
        editFounderLastName.resignFirstResponder()
        editFounderPreferredName.resignFirstResponder()
        editFounderCompany.resignFirstResponder()
        editFounderSpouse.resignFirstResponder()
        editFounderPhone.resignFirstResponder()
        editFounderEmail.resignFirstResponder()
        editFounderBio.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == editFounderPhone {
            editFounderPhone.text = Helpers.formatPhoneNumber(number: editFounderPhone.text!)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            editFounderImageView.contentMode = .scaleAspectFill
            editFounderImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
