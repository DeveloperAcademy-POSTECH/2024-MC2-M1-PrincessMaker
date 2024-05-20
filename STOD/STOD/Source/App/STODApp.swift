//
//  STODApp.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI
import SwiftData

@main
struct STODApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            Home()
        }
        .modelContainer(sharedModelContainer)
    }
}
