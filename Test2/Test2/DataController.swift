//
//  DataController.swift
//  Test2
//
//  Created by 溝口洸熙 on 2022/09/17.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores{description, error in
            if let error = error {
                print("Core Data failed to load :\(error.localizedDescription)")
            }
        }
    }
}
