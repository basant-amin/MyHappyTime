//
//  MyHappyTimeApp.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 06/12/2024.
//

import SwiftUI
import SwiftData

@main
struct MyHappyTimeApp: App {
    @Environment(\.modelContext) var modelContext
    var body: some Scene {
        WindowGroup {
            MainPageView()

        }        .modelContainer(for: [ScheduleItem.self, Category.self, CustomImagePicker.self])
    }
}
