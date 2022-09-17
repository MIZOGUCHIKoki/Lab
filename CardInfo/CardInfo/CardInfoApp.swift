//
//  CardInfoApp.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI
struct ViewMode: EnvironmentKey {
    typealias Value = Bool
    static var defaultValue: Bool = true
}

extension EnvironmentValues {
    var viewMode: Bool {
        get { return self[ViewMode.self] }
        set { self[ViewMode.self] = newValue }
    }
    /// True: Add InfoView, False: Edit InfoView
}

@main
struct CardInfoApp: App {
    let persistenceController = PersistenceController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
