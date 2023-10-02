//
//  SwiftData_iTourApp.swift
//  SwiftData-iTour
//
//  Created by Heecheon Park on 10/2/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftData_iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Provides modelContext as Environment
        .modelContainer(for: Destination.self)
    }
}
