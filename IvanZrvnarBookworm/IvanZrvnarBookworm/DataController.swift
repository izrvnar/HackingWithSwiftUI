//
//  DataController.swift
//  IvanZrvnarBookworm
//
//  Created by Ivan Zrvnar on 2022-07-05.
//

import SwiftUI
import CoreData

class DataContoller: ObservableObject{
    // 1) prepare to load data model to core data
    let container = NSPersistentContainer(name: "Bookworm")
    
    // loading the data store
    init(){
        container.loadPersistentStores{description, error in
            if let error = error {
                print("Core Data failed to load \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
}
