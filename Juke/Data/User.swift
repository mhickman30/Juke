//
//  User.swift
//  Juke
//
//  Created by Student on 5/2/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import Foundation


class User {
    var username: String
    var password: String
    var personalInfo: [String]
    var email: String
    var firstName: String
    var lastName: String
    
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user").appendingPathExtension("plist")
    
    init(username: String, password: String, personalInfo: [String], email: String, firstname: String, lastname: String) {
        self.username = username
        self.password = password
        self.personalInfo = personalInfo
        self.email = email
        self.firstName = firstname
        self.lastName = lastname
    }
}
