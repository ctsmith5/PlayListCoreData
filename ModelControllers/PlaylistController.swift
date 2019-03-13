//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Colin Smith on 3/12/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
   
    
    
    static let shared = PlaylistController()
    
    var playlists: [Playlist] {
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        
        
        let results = try? moc.fetch(fetchRequest)
        return results ?? []
    }
    
    
    //create new and sync to persistent store
    func createPlaylistWith(name: String) {
        _ = Playlist(name: name)
        saveToPersistentStore()
    }
    
    
    //delete from context and sync persistent store
    func deletePlaylist(playlist: Playlist){
        
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
    }
    
    
    
    // SAVE
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        
        do{
            try moc.save()
        }catch{
            print("error saving to persistnent Store \(error.localizedDescription)")
            
        }
    }
    
    
    
    
    
    
    
    
    
    
}
