//
//  Party.swift
//  Juke
//
//  Created by Student on 5/4/18.
//  Copyright © 2018 Matt Hickman. All rights reserved.
//  look at this link for how to share data between apps
//  https://agostini.tech/2017/08/13/sharing-data-between-applications-and-extensions-using-app-groups/

import Foundation

class Party {
    
    var name: String
    var playlist: [String]
    //var song: Song
    var description: String
    var hostName: String?
    
    init(name: String, playlist: [String], description: String, hostName: String) {
        self.name = name
        self.playlist = playlist
        //self.song = song
        self.description = description
        self.hostName = hostName
    }
}

class Song {
    
    var title: String
    var artist: String
    var upvotes: Int
    var downvotes: Int
    
    init(title: String, artist: String, upvotes: Int, downvotes: Int){
        self.title = title
        self.artist = artist
        self.upvotes = 0
        self.downvotes = 0
    }
}
