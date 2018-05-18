//
//  PartyPlaylistTableViewController.swift
//  Juke
//
//  Created by Student on 5/4/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class PartyPlaylistTableViewController: UITableViewController {

    var parties: [Party] = [Party(name: "Practice Party 1", playlist: [], description: "1st practice", hostName: "Matt Hickman"), Party(name: "Practice Party 2", playlist: [], description: "2nd practice", hostName: "Matt Hickman"), Party(name: "Practice Party 3", playlist: [], description: "3rd practice", hostName: "Matt Hickman")]
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            parties.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return parties.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath)
        let party = parties[indexPath.row]
        cell.textLabel?.text = party.name
        cell.detailTextLabel?.text = "By \(party.hostName ?? "Name")"

        return cell
    }
    
    @IBAction func unwindFromNewPartyTableViewController(_ sender: UIStoryboardSegue){
        if sender.source is NewPartyTableViewController {
            if let senderVC = sender.source as? NewPartyTableViewController {
                if let newParty = senderVC.party {
                    print(newParty.name)
                    parties.append(newParty)
                } else {
                    print("There was no new party entered")
                }
            }
            tableView.reloadData()
        }
    }

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

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSongs" {
            let destinationVC = segue.destination as! SinglePlaylistTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedParty = parties[indexPath.row]
            destinationVC.party = selectedParty
            print(selectedParty.name)
            segue.destination.navigationItem.title = selectedParty.name
        }
    }
 

}
