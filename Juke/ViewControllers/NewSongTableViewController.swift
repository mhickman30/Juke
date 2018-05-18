//
//  NewSongTableViewController.swift
//  Juke
//
//  Created by Student on 5/4/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class NewSongTableViewController: UITableViewController {

    var song: Song?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
    }
    
    func updateSaveButton() {
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    @IBAction func nameTextFieldChanged(_ sender: Any) {
        updateSaveButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else {return}
        
        let title = nameTextField.text ?? "No Title"
        let artist = artistTextField.text ?? "Unknown Artist"
        let image = UIImagePNGRepresentation(#imageLiteral(resourceName: "download"))
        
        song = Song(title: title, artist: artist, upvotes: 0, downvotes: 0, imageData: image)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
}
