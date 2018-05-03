//
//  SettingsViewController.swift
//  Juke
//
//  Created by Student on 5/3/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    var user: User?
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
