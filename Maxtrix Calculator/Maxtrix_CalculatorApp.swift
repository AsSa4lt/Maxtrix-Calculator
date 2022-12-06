//
//  Maxtrix_CalculatorApp.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import SwiftUI

@main
struct Maxtrix_CalculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
