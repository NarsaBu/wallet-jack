//
//  wallet_jackApp.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 20.05.2024.
//

import SwiftUI
import SwiftData

@main
struct Application: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            IncomeExpenseCategory.self,
            Transaction.self,
            Account.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AppTabView()
        }
        .modelContainer(sharedModelContainer)
    }
}
