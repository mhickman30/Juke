//
//  ProfileViewController.swift
//  Juke
//
//  Created by Student on 5/3/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var changePicutreButton: UIButton!
    
    var username: String?
    var password: String?
    
    var user: User?
    
    func updateView() {

        if let imageData = user?.imageData,
            let image = UIImage(data: imageData) {
            changePicutreButton.setTitle("", for: .normal)
            changePicutreButton.setBackgroundImage(image, for: .normal)
        } else {
            changePicutreButton.setTitle("Change", for: .normal)
            changePicutreButton.setBackgroundImage(#imageLiteral(resourceName: "man"), for: .normal)
        }
        
        usernameLabel.text = "@" + (user?.username)!
        firstnameLabel.text = user?.firstName
        lastnameLabel.text = user?.lastName
        emailLabel.text = user?.email
    }
    
    @IBAction func changePictureButtonTapped(_ sender: Any) {
        print("change button was tapped")
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Take Photo", style: .default, handler: { (_) in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        user?.imageData = UIImagePNGRepresentation(image)
        
        dismiss(animated: true) {
            self.updateView()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        /*
        usernameLabel.text = "@" + username!
        firstnameLabel.text = user?.firstName
        lastnameLabel.text = user?.lastName
        emailLabel.text = user?.email
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
 

}
