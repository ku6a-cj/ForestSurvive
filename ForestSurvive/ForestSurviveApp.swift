//
//  ForestSurviveApp.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI

@main
struct ForestSurviveApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
