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
    var personalInfo: String
    var preferences: String
    
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user").appendingPathExtension("plist")
    

}


class Host: User {
    
}

class Guest: User {
    
}
