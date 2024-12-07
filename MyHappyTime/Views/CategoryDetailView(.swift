//
//  CategoryItemslView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 07/12/2024.
//

import SwiftUI

struct CategoryItemsView: View {
    var category: Category
    @ObservedObject var scheduleViewModel: ScheduleViewModel
//    @State private var searchText = ""
//    private var filteredItems: [ScheduleItem] {
//        if searchText.isEmpty {
//            return category.items
//        } else {
//            return category.items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
//        }
//    }
    
    var body: some View {
        // Remove Text Adress And Write Your Content Here
      Text("Category Items View")
        
        
      
        
  
        
        
        
    }
}




#Preview {
    let scheduleViewModel = ScheduleViewModel()
    let sampleCategory = Category(
        name: "Sample Category",
        image: "star",
        items: [
            ScheduleItem(id: UUID(), name: "Sample Item 1", image: "star"),
            ScheduleItem(id: UUID(), name: "Sample Item 2", image: "star.fill")
        ]
    )
    
    return CategoryItemsView(
        category: sampleCategory,
        scheduleViewModel: scheduleViewModel
    )
}

