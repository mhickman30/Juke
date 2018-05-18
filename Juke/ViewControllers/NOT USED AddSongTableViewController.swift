//
//  AddSongTableViewController.swift
//  Juke
//
//  Created by Student on 5/17/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class AddSongTableViewController: UITableViewController {

    var song: Song?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    func updateSaveButtonState() {
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
   
    @IBAction func returnPressed(_ sender: UITextField) {
        nameTextField.resignFirstResponder()
    }
    @IBAction func returnPressedArtist(_ sender: UITextField) {
        artistTextField.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = nameTextField.text ?? "No Title"
        let artist = artistTextField.text ?? "Unknown"
        let image = UIImagePNGRepresentation(#imageLiteral(resourceName: "download"))
        
        
        song = Song(title: title, artist: artist, upvotes: 0, downvotes: 0, imageData: image)
    }
 

}
