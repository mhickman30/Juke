//
//  LogInViewController.swift
//  Juke
//
//  Created by Student on 5/2/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let settingsViewController = segue.destination as? SettingsViewController {
            let username = usernameTextField.text
            let password = passwordTextField.text
            
            settingsViewController.username = username
            
        }
    }
 

}
