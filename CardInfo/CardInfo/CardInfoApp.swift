//
//  CardInfoApp.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI
@main
struct CardInfoApp: App {
    private let persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
