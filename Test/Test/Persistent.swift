//
//  Persistent.swift
//  MyCoreData
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {// イニシャライザ
        // 引数にモデル名を入れる
        container = NSPersistentContainer(name: "MyCoreData")
        
        // PersistentStoreを作成
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            // 失敗時にアプリを落とす
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
