//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by luke parker on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    // MARK Singleton
    
    //MARK CRUD
    var playlists: [Playlist] {
    let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
    return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    //CREATE
    func createPlaylist(playlistWithName name: String) {
        Playlist(name: name)
        //Save to persistent store
        saveToPersistentStore()
    }
    //DELETE
    func deletePlaylist(playlistToDelete: Playlist) {
        CoreDataStack.context.delete(playlistToDelete)
        saveToPersistentStore()
    }
    //SAVE
    func saveToPersistentStore() {
        
        do {
        try CoreDataStack.context.save()
    } catch {
    print("There was an error in \(#function) : \(error.localizedDescription)")
        }
    }
}
