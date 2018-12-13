//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by luke parker on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    
    static let sharedInstance = SongController()
    
    //CRUD-Create
    func createSong(songWithTitle title: String, artist: String, playList: Playlist) {
        Song(title: title, artist: artist, playlist: playList)
        PlaylistController.sharedInstance.saveToPersistentStore()
        //DELETE
    }
    func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    //
    
}

