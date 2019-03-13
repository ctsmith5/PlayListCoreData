//
//  Playlist+Convenience.swift
//  Playlist2CoreData
//
//  Created by Colin Smith on 3/13/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation
import CoreData
extension Playlist {
    convenience init(title: String, songs: [Song] = [], context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
       
    }
}
