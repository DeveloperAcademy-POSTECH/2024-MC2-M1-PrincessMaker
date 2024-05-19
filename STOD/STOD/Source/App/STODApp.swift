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
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    
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
            if firstLaunch {
                Onboarding()
            } else {
                ContentView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
