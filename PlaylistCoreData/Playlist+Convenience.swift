//
//  Playlist+Convenience.swift
//  PlaylistCoreData
//
//  Created by luke parker on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
    
    @discardableResult
    convenience init(name: String, songs: [Song] = [], moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
        
    }
}
