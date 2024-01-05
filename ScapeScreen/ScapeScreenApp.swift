//
//  ScapeScreenApp.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 26/12/23.
//

import SwiftUI
import SwiftData

@main
struct ScapeScreenApp: App {
    
    let RenditionContainer: ModelContainer
    
    init() {
        do {
            RenditionContainer = try ModelContainer(for: Rendition.self)
        } catch {
            fatalError("Could not initialize RenditionContainer")
        }
    }
    var body: some Scene {
        WindowGroup {
            TabView {
                
                ContentView()
                    .tabItem {
                        Image(systemName: "pencil")
                    }
                SavedCanvasView()
                    .tabItem {
                        Image(systemName: "archivebox")
                    }
            }
        }
        .modelContainer(RenditionContainer)
    }
}
