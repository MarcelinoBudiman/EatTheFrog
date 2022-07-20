//
//  EatTheFrogApp.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 20/07/22.
//

import SwiftUI

@main
struct EatTheFrogApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
