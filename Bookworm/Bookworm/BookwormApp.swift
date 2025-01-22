//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Razvan Pricop on 12.12.24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
