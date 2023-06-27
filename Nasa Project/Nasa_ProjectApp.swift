//
//  Nasa_ProjectApp.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/26/23.
//

import SwiftUI

@main
struct Nasa_ProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
