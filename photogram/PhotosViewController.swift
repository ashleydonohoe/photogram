//
//  PhotosViewController.swift
//  photogram
//
//  Created by Ashley Donohoe on 5/27/17.
//  Copyright © 2017 Ashley Donohoe. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logoutPressed(_:)))
        tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "📷", style: .plain, target: self, action: #selector(addPhotoPressed(_:)))

    }
    
 @IBAction func logoutPressed(_ sender: Any) {
        do {
            try FIRAuth.auth()?.signOut()
            dismiss(animated: true, completion: nil)
        } catch {
           print("Error signing out")
        }
    }

    @IBAction func addPhotoPressed(_ sender: Any) {
        print("Add photo")
        performSegue(withIdentifier: "pickImageSegue", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as UITableViewCell
        return cell
    }
}
