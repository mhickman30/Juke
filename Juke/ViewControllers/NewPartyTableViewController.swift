//
//  NewPartyTableViewController.swift
//  Juke
//
//  Created by Student on 5/17/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class NewPartyTableViewController: UITableViewController {

    var party: Party?
    
    @IBOutlet weak var partyNameTextField: UITextField!
    @IBOutlet weak var hostNameTextField: UITextField!
    @IBOutlet weak var playlistTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if (sender.isOn==true) {
            output.text = "18+"
        }
        else {
            output.text = "All Ages"
        }
        
    }
    @IBAction func unwindSegue(_ sender: UIStoryboard) {
        
    }
    
    func updateSaveButton() {
        let text = partyNameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
    }
    
    @IBAction func nameFieldChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //super.prepare(for: segue, sender: sender)
        
        //guard segue.identifier == "saveUnwind" else { return }
        
        let partyName = partyNameTextField.text ?? "No Name"
        let hostName = hostNameTextField.text ?? "No Host"
        let playlist = playlistTextField.text ?? "No Playlist Name"
        let description = descriptionTextField.text ?? "No Description"
        
        party = Party(name: partyName, playlist: [playlist], description: description, hostName: hostName)
    }
  

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
