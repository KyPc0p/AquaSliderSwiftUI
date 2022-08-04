//
//  GoalsAppSwiftUIApp.swift
//  GoalsAppSwiftUI
//
//  Created by Артём Харченко on 04.08.2022.
//

import SwiftUI

@main
struct GoalsAppSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
