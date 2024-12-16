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
            name: "Daily Routine",
            image: "sun",
            items: [
                ScheduleItem(id: UUID(), name: "Nap", image: "routin1"),
                ScheduleItem(id: UUID(), name: "Wake Up", image: "routin2"),
                ScheduleItem(id: UUID(), name: "Sleep", image: "routin3"),
      
            ]
        ),
        Category(
            id: UUID(),
            name: "Trips",
            image: "trip",
            items: [
                ScheduleItem(id: UUID(), name: "resturant", image: "trip1"),
                ScheduleItem(id: UUID(), name: "Park", image: "trip2"),
                ScheduleItem(id: UUID(), name: "Summaring", image: "trip3"),
                ScheduleItem(id: UUID(), name: "Garden", image: "trip4"),
                ScheduleItem(id: UUID(), name: "Camping", image: "trip5"),
                ScheduleItem(id: UUID(), name: "مطعم", image: "trip6")

            ]
        ),

        Category(
            id: UUID(),
            name: "Personal cleaning",
            image: "booth",
            items: [
                ScheduleItem(id: UUID(), name: "Shower", image: "clean1"),
                ScheduleItem(id: UUID(), name: "Hair Styling", image: "clean2"),
                ScheduleItem(id: UUID(), name: "Brush teeth", image: "clean3"),
                ScheduleItem(id: UUID(), name: "Wash Hands", image: "clean4"),
                ScheduleItem(id: UUID(), name: "Throwing trash", image: "clean5"),
                ScheduleItem(id: UUID(), name: "Make bed", image: "clean6"),
                ScheduleItem(id: UUID(), name: "Cuth hair", image: "clean7"),
                ScheduleItem(id: UUID(), name: "Cut nails", image: "clean8"),
            ]
        ),
        Category(
            id: UUID(),
            name: "Animals",
            image: "cuts",
            items: [
                ScheduleItem(id: UUID(), name: "Bird", image: "animal1"),
                ScheduleItem(id: UUID(), name: "Camel", image: "animal2"),
                ScheduleItem(id: UUID(), name: "Cat", image: "anima3"),
                ScheduleItem(id: UUID(), name: "Chicken", image: "anima4"),
                ScheduleItem(id: UUID(), name: "Cow", image: "anima5"),
                ScheduleItem(id: UUID(), name: "Dog", image: "anima6"),
                ScheduleItem(id: UUID(), name: "Fish", image: "anima7"),
                ScheduleItem(id: UUID(), name: "Horse", image: "anima8"),
                ScheduleItem(id: UUID(), name: "Coala", image: "anima9"),
                ScheduleItem(id: UUID(), name: "Pigeon", image: "anima10"),
                ScheduleItem(id: UUID(), name: "Cheep", image: "animal11"),
                ScheduleItem(id: UUID(), name: "Turtles", image: "animal12"),
            ]
        ),
        Category(
            id: UUID(),
            name: "Meals",
            image: "brunch",
            items: [
                ScheduleItem(id: UUID(), name: "Noodles", image: "meal1"),
                ScheduleItem(id: UUID(), name: "Rice and chicken", image: "meal2"),
                ScheduleItem(id: UUID(), name: "kofta and spaghetti", image: "meal3"),
                ScheduleItem(id: UUID(), name: "Vegetables", image: "meal4"),
                ScheduleItem(id: UUID(), name: "Snacks", image: "meal5"),
                ScheduleItem(id: UUID(), name: "Fruits", image: "meal6"),

            ]
        ),
        Category(
            id: UUID(),
            name: "Puplic",
            image: "friends",
            items: [
                ScheduleItem(id: UUID(), name: "Gym", image: "puplic1"),
                ScheduleItem(id: UUID(), name: "Market", image: "puplic2"),
                ScheduleItem(id: UUID(), name: "School", image: "puplic3"),
                ScheduleItem(id: UUID(), name: "Mall", image: "puplic4"),
                ScheduleItem(id: UUID(), name: "Hospital", image: "puplic5"),
                ScheduleItem(id: UUID(), name: "Liberary", image: "puplic6")
            ]
        ),
        Category(
            id: UUID(),
            name: "Transport",
            image: "cars",
            items: [
                ScheduleItem(id: UUID(), name: "Submarine", image: "trans1"),
                ScheduleItem(id: UUID(), name: "Train", image: "trans2"),
                ScheduleItem(id: UUID(), name: "Helicopter", image: "trans3"),
                ScheduleItem(id: UUID(), name: "Bus", image: "trans4"),
                ScheduleItem(id: UUID(), name: "Bike", image: "trans5"),
                ScheduleItem(id: UUID(), name: "Car", image: "trans6"),
                ScheduleItem(id: UUID(), name: "Airplane", image: "trans7"),
                ScheduleItem(id: UUID(), name: "Ship", image: "trans8"),
                ScheduleItem(id: UUID(), name: "Train", image: "trans9")
            ]
        ),
        Category(
                    id: UUID(),
                    name: "wearings",
                    image: "cloth",
                    items: [
                ScheduleItem(id: UUID(), name: "Wearing Shirt", image: "dress1"),
                ScheduleItem(id: UUID(), name: "Wearing Shirt", image: "dress2"),
                ScheduleItem(id: UUID(), name: "Wearing Shirt", image: "dress3"),
                ScheduleItem(id: UUID(), name: "Wearing dress", image: "dress4"),
                ScheduleItem(id: UUID(), name: "Wearing Socks", image: "dress5"),
                ScheduleItem(id: UUID(), name: "School uniform", image: "dress6"),
                ScheduleItem(id: UUID(), name: "Wearing shoes", image: "dress9")

                        
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

