//
//  User.swift
//  Juke
//
//  Created by Student on 5/2/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//

import Foundation


class User: NSObject, NSCoding {
    
    var username: String
    var password: String
    var email: String
    var firstName: String
    var lastName: String
    
    init(username: String, password: String, email: String, firstname: String, lastname: String) {
        self.username = username
        self.password = password
        self.email = email
        self.firstName = firstname
        self.lastName = lastname
    }
    
    struct PropertyKey {
        static let username = "username"
        static let password = "password"
        static let email = "email"
        static let firstName = "firstName"
        static let lastName = "lastName"
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user").appendingPathExtension("plist")
    
    static func saveToDos(_ users: [User]) {
        NSKeyedArchiver.archiveRootObject(users, toFile: User.ArchiveURL.path)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let username = aDecoder.decodeObject(forKey: PropertyKey.username) as? String,
            let password = aDecoder.decodeObject(forKey: PropertyKey.password) as? String else {
                return nil
        }
        
        let email = aDecoder.decodeObject(forKey: PropertyKey.email)
        let firstName = aDecoder.decodeObject(forKey: PropertyKey.firstName) as? String
        let lastName = aDecoder.decodeObject(forKey: PropertyKey.lastName) as? String
        
        self.init(username: username, password: password, email: email, firstname: firstName, lastname: lastName)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(username, forKey: PropertyKey.username)
        aCoder.encode(password, forKey: PropertyKey.password)
        aCoder.encode(email, forKey: PropertyKey.email)
        aCoder.encode(firstName, forKey: PropertyKey.firstName)
        aCoder.encode(lastName, forKey: PropertyKey.lastName)
    }
    
    static func loadUsers() -> [User]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? [User]
    }
    
    
    
    
}
