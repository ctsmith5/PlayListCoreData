//
//  PlaylistController.swift
//  Playlist2CoreData
//
//  Created by Colin Smith on 3/13/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation

import CoreData

class PlaylistController {
    
    //Singleton
    static let shared = PlaylistController()
    
    //Source of Truth
    
    //CRUD
    //Create
    func add(playlistWithTitle title: String){
        Playlist(title: title)
        //Save
    }
    //Delete
    
    //Persistence
    func saveToPersistentStore(){
        do{
            try CoreDataStack.context.save()
        }catch{
            print("There was an error in \(#function) \(error) \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore(){
        //grab playlist off of hard drive
        let request = NSFetchRequest<Playlist> = Playlist.fetchRequest()
        
        
        return(try? CoreDataStack.context.fetch(request)) ?? []
        
        //deal with the throw
    }
    func delete(playlist: Playlist){
        CoreDataStack.context.delete(playlist)
        saveToPersistStore()
    }
    
}
