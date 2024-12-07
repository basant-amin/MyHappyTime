//
//  ScheduleViewModel.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 06/12/2024.
//

import Foundation

class ScheduleViewModel: ObservableObject {
    @Published var schedule: [ScheduleItem] = []
    @Published var categories: [Category] = [
        Category(
            id: UUID(),
            name: "Food",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "Wearing",
            image: "wearing",
            items: [
                ScheduleItem(id: UUID(), name: "Shirt", image: "shirt"),
                ScheduleItem(id: UUID(), name: "Pants", image: "pants"),
                ScheduleItem(id: UUID(), name: "Shoes", image: "shoes")
            ]
        ),
        Category(
            id: UUID(),
            name: "Personal",
            image: "personal",
            items: [
                ScheduleItem(id: UUID(), name: "Brush Teeth", image: "toothbrush"),
                ScheduleItem(id: UUID(), name: "Wash Face", image: "wash"),
                ScheduleItem(id: UUID(), name: "Hair Comb", image: "comb")
            ]
        )
    ]
    
    func addCategory(name: String, imageName: String, items: [ScheduleItem] = []) {
        let newCategory = Category(
            id: UUID(),
            name: name,
            image: imageName,
            items: items
        )
        categories.append(newCategory)
    }

    func addItem(to categoryID: UUID, itemName: String, imageName: String) {
        guard let index = categories.firstIndex(where: { $0.id == categoryID }) else {
            print("Category not found")
            return
        }
        let newItem = ScheduleItem(id: UUID(), name: itemName, image: imageName)
        categories[index].items.append(newItem)
    }

}

