//
//  ScheduleModel.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 06/12/2024.
//

import Foundation
import PhotosUI
import SwiftData

@Model
class ScheduleItem: Identifiable {
    var id: UUID
    var name: String
    var image: String
    init(id: UUID, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}

@Model
class Category: Identifiable {
    var id: UUID
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

@Model
class CustomImagePicker: Identifiable {
    var id: UUID
    var imageData: Data?
    var name: String

    init(id: UUID = UUID(), imageData: Data?,  name: String) {
        self.id = id
        self.imageData = imageData
        self.name = name
    }

    var image: UIImage? {
        guard let imageData else { return nil }
        return UIImage(data: imageData)
    }
}
