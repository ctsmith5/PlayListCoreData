//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Colin Smith on 3/12/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation
import CoreData


class SongController {
    
    static let shared = SongController()
    
    
    
   static func createSongWith(title: String, artitst: String, playlist: Playlist){
       
        
        let _ = Song(artist: artitst, title: title, playlist: playlist)
        
        PlaylistController.shared.saveToPersistentStore()
        
    }
   static  func delete(song: Song){
        
       let moc = CoreDataStack.context
        moc.delete(song)
        PlaylistController.shared.saveToPersistentStore()
        
    }
}
