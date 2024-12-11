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
            name: "روتين يومي",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "رحلات",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "اشخاص",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "النظافة الشخصية",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "حيوانات",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "وجبات",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "مرافق عامة",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "مواصلات",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "ملابس",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
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

