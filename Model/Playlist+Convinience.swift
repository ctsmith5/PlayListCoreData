//
//  Playlist+Convinience.swift
//  PlaylistCoreData
//
//  Created by Colin Smith on 3/12/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation
import CoreData
extension Playlist {
    
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context){
        
        self.init(context: context)
        
        self.name = name
    }
}
