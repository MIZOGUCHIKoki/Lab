//
//  Persistent.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    init () {
        container = NSPersistentContainer(name: "CardInfoDB")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
