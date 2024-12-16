//
//  ScheduleModel.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 06/12/2024.
//

import Foundation


struct ScheduleItem: Identifiable {
    let id: UUID
    var name: String
    var image: String
}

class Category: Identifiable {
    let id: UUID
    var name: String
    var image: String
    var items: [ScheduleItem]
    
    init(id: UUID = UUID(), name: String, image: String, items: [ScheduleItem] = []) {
        self.id = id
        self.name = name
        self.image = image
        self.items = items
    }
    
}
