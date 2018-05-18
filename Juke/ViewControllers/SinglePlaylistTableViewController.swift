//
//  SinglePlaylistTableViewController.swift
//  Juke
//
//  Created by Student on 5/17/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class SinglePlaylistTableViewController: UITableViewController {

    
    @IBOutlet weak var playlistName: UINavigationItem!
    
    var party: Party?
    
    var songs: [Song] = [Song(title: "Jukebox Hero", artist: "Foreigner", upvotes: 0, downvotes: 0, imageData: UIImagePNGRepresentation(#imageLiteral(resourceName: "download")))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentParty = party {
            playlistName.title = currentParty.name
            print(currentParty.name)
        } else {
            print("Error. No current party")
        }
    }
    
    @IBAction func unwindFromNewSong(_ sender: UIStoryboardSegue){
        if sender.source is NewSongTableViewController {
            if let senderVC = sender.source as? NewSongTableViewController {
                if let newSong = senderVC.song {
                    print(newSong.title)
                    songs.append(newSong)
                } else {
                    print("There was no new song entered")
                }
            }
            tableView.reloadData()
        }
    }


    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        return songs.count
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCellIdentifier", for: indexPath) as? SongCell else {
            fatalError("Could not dequeue a cell")
        }

        let song = songs[indexPath.row]
        cell.songLabel?.text = song.title
        cell.artistLabel?.text = song.artist
        cell.songIcon?.image = #imageLiteral(resourceName: "download")
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }

 
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/
 
}

