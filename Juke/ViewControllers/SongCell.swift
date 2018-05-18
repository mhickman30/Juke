//
//  SongCell.swift
//  Juke
//
//  Created by Student on 5/17/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songIcon: UIImageView!
    
    @IBOutlet weak var votesLabel: UILabel!

    @IBAction func voteStepper(_ sender: UIStepper) {
        //var val = Int(sender.value)
        votesLabel.text = "Votes: " + String(Int(sender.value))
    }
    
}
