//
//  addPartyTableViewController.swift
//  Juke
//
//  Created by Student on 5/14/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class addPartyTableViewController: UITableViewController {

    @IBOutlet weak var partyNametextfield: UITextField!
    @IBOutlet weak var hostNametextfield: UITextField!
    @IBOutlet weak var playlistNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var party : Party?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let party = party{
            party.hostName = hostNametextfield.text!
            party.name = partyNametextfield.text!
            party.description = descriptionTextField.text!
        }
        ubdatesavebutt()
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "addCell" else {return}
        let partyname = partyNametextfield.text ?? ""
        let hostname = hostNametextfield.text ?? ""
        let des = descriptionTextField.text ?? ""
        party = Party(name: partyname, playlist: [playlistNameTextField.text!], description: des, hostName: hostname)
    }
    
    func ubdatesavebutt () {
        let partyName = partyNametextfield.text ?? ""
        let hostName = hostNametextfield.text ?? ""
        saveButton.isEnabled = !partyName.isEmpty && !hostName.isEmpty
    }
    
    @IBAction func ediittex(_ sender: UITextField) {
        ubdatesavebutt()
    }


}
