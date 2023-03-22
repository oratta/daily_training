//
//  OnePanApp.swift
//  OnePan
//
//  Created by Kentaro Uesugi on 2023/03/22.
//

import SwiftUI

@main
struct OnePanApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
