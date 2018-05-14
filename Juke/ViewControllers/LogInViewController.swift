//
//  LogInViewController.swift
//  Juke
//
//  Created by Student on 5/2/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    var users: [User?] = []
    var realUser: User?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
  /*      if let savedUsers = User.loadUsers() {
            users = savedUsers
            for user in savedUsers {
                if user.username == usernameTextField.text && user.password == passwordTextField.text {
                    users.append(user)
                    realUser = user
                }
            }
        } else {
            viewDidLoad()
        }
        */
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
        if (segue.identifier == "loginSegue") {
            print("Log in button hit")
            if let savedUsers = User.loadUsers() {
                users = savedUsers
                for user in savedUsers {
                    if user.username == usernameTextField.text && user.password == passwordTextField.text {
                        users.append(user)
                        realUser = user
                    }
                }
            } else {
                viewDidLoad()
            }
            
            if let tabViewController = segue.destination as? UITabBarController {
                let destinationVC = tabViewController.viewControllers!.first as! ProfileViewController
                
                destinationVC.username = usernameTextField.text!
                
                
                //if let username = usernameTextField.text {
                //    profileViewController.usernameLabel.text! = username
                //}
                //let password = passwordTextField.text
                
                
            }
        } else if (segue.identifier == "signupSegue") {
            print("Sign Up button hit")
        }/*
        if let tabViewController = segue.destination as? UITabBarController {
            let profileViewController = tabViewController.viewControllers!.first as! ProfileViewController
            let username = usernameTextField.text
            print(42)
            //let password = passwordTextField.text
            
            profileViewController.usernameLabel.text = username
            
        }*/
    }
 

}
