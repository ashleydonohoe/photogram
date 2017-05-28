//
//  NewPhotoViewController.swift
//  photogram
//
//  Created by Ashley Donohoe on 5/27/17.
//  Copyright © 2017 Ashley Donohoe. All rights reserved.
//

import UIKit

class NewPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var imageDescriptionTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        postButton.isEnabled = false
        imagePicker.delegate = self
        
        imagePicker.sourceType = .photoLibrary
        
        // Will eventually allow editing
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = image
        
        postButton.isEnabled = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        // Upload image
        
        // Add imageURL and description to database
        
    }
}
