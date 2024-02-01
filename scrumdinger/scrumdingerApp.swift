//
//  scrumdingerApp.swift
//  scrumdinger
//
//  Created by Liliana Popa on 29.01.2024.
//

import SwiftUI

@main
struct scrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        

        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
