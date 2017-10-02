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
        
        performSegue(withIdentifier: Storyboard.ExitSegueIdentifier, sender: nil)
    }
    
    @IBAction func editFounderImage(_ sender: Any) {
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = .photoLibrary
        
        let picker = UIImagePickerController()
        picker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
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
        
//        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func toggleListEmailSwitch(_ sender: UISwitch) {
        print("toggle list email")
    }
    
    @IBAction func toggleListPhoneSwitch(_ sender: UISwitch) {
        print("toggle list phone")
    }
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        imagePicker.delegate = self
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func configure() {
        editFounderImageView.image = UIImage(named: (founder?.photo)!)
        editFounderFirstName.text = founder?.firstName
        editFounderLastName.text = founder?.lastName
        editFounderPreferredName.text = founder?.preferredName
        editFounderCompany.text = founder?.company
        editFounderSpouse.text = founder?.spouseName
        editFounderPhone.text = founder?.phone
        editFounderEmail.text = founder?.email
        editFounderBio.text = founder?.bio
        
        // make image and buttons circular
        styleImageView(image: editFounderImageView)
        styleButton(button: editFounderImageButton)
    }
    
    // MARK: - Private Helpers
    
    private func saveDetails() {
        FounderDirectory.sharedInstance.founders[0].firstName = "Cool"
        print("save details")
        
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
    
    // MARK: - Data Source Model Association
    
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
