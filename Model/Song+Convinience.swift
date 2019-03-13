//
//  Song+Convinience.swift
//  PlaylistCoreData
//
//  Created by Colin Smith on 3/12/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    convenience init(artist: String, title: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {
        
        
        self.init(context: context)
        self.artist = artist
        self.title = title
        self.playlist = playlist
    }
    
    
    
}
