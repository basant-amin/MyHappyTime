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
                ScheduleItem(id: UUID(), name: "قيلولة", image: "routin1"),
                ScheduleItem(id: UUID(), name: "يستقيظ", image: "routin2"),
                ScheduleItem(id: UUID(), name: "نوم", image: "routin3"),
                ScheduleItem(id: UUID(), name: "سرير", image: "routin4")
            ]
        ),
        Category(
            id: UUID(),
            name: "رحلات",
            image: "food",
            items: [
                ScheduleItem(id: UUID(), name: "رحلة", image: "trip1"),
                ScheduleItem(id: UUID(), name: "تخييم", image: "trip2"),
                ScheduleItem(id: UUID(), name: "حديقة", image: "trip3"),
                ScheduleItem(id: UUID(), name: "مصيف", image: "trip4"),
                ScheduleItem(id: UUID(), name: "ملاهي", image: "trip5"),
                ScheduleItem(id: UUID(), name: "مطعم", image: "trip6")

            ]
        ),

        Category(
            id: UUID(),
            name: "النظافة الشخصية",
            image: "booth",
            items: [
                ScheduleItem(id: UUID(), name: "استحمام", image: "clean1"),
                ScheduleItem(id: UUID(), name: "تمشيط", image: "clean2"),
                ScheduleItem(id: UUID(), name: "غسل اسنان", image: "clean3"),
                ScheduleItem(id: UUID(), name: "غسل اليدين", image: "clean4"),
                ScheduleItem(id: UUID(), name: "قص اظافر", image: "clean5"),
                ScheduleItem(id: UUID(), name: "ارمي القمامه", image: "clean6"),
             
            ]
        ),
        Category(
            id: UUID(),
            name: "حيوانات",
            image: "cuts",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "وجبات",
            image: "brunch",
            items: [
                ScheduleItem(id: UUID(), name: "طائر", image: "animal1"),
                ScheduleItem(id: UUID(), name: "جمل", image: "animal2"),
                ScheduleItem(id: UUID(), name: "قطه", image: "animal3"),
                ScheduleItem(id: UUID(), name: "دجاجة", image: "animal4"),
                ScheduleItem(id: UUID(), name: "بقرة", image: "animal5"),
                ScheduleItem(id: UUID(), name: "سمكة", image: "animal6"),
                ScheduleItem(id: UUID(), name: "حصان", image: "animal7"),
                ScheduleItem(id: UUID(), name: "كوالا", image: "animal8"),
                ScheduleItem(id: UUID(), name: "حمامه", image: "animal9"),
                ScheduleItem(id: UUID(), name: "خروف", image: "dinner10")
            ]
        ),
        Category(
            id: UUID(),
            name: "مرافق عامة",
            image: "friends",
            items: [
                ScheduleItem(id: UUID(), name: "نادي", image: "facilities1"),
                ScheduleItem(id: UUID(), name: "سوبرماركت", image: "facilities2"),
                ScheduleItem(id: UUID(), name: "مدرسة", image: "facilities3"),
                ScheduleItem(id: UUID(), name: "سوق", image: "facilities4"),
                ScheduleItem(id: UUID(), name: "مستشفى", image: "facilities5")
            ]
        ),
        Category(
            id: UUID(),
            name: "مواصلات",
            image: "cars",
            items: [
                ScheduleItem(id: UUID(), name: "Breakfast", image: "breakfast"),
                ScheduleItem(id: UUID(), name: "Lunch", image: "lunch"),
                ScheduleItem(id: UUID(), name: "Dinner", image: "dinner")
            ]
        ),
        Category(
            id: UUID(),
            name: "ملابس",
            image: "cloth",
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

