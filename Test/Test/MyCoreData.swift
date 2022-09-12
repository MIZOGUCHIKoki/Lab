//
//  TestApp.swift
//  Test
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI

@main
struct MyCoreData: App {
    // Containerが作成される
    let persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // 第1引数managedObjectContext というenvironmentValueの場所
            // 第2引数environmentValueに格納する値
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
