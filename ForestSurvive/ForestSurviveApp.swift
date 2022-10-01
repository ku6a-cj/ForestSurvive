//
//  ForestSurviveApp.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI

@main
struct ForestSurviveApp: App {
    var body: some Scene {
        
        let persistanceContainer = PersistanceController.shared
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceContainer.containter.viewContext )
            
        }
    }
}
