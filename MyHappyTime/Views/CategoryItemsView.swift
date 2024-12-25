//
//  CategoryItemslView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 07/12/2024.
//

import SwiftUI
import SwiftData
struct CategoryItemsView: View {
    @Environment(\.modelContext) var modelContext
    var category: Category
    @ObservedObject var scheduleViewModel: ScheduleViewModel
    @State private var searchText = ""
    private var filteredItems: [ScheduleItem] {
        if searchText.isEmpty {
            return category.items
        } else {
            return category.items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color.slight.edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 10) {
                        // Display the category name
                        Text(category.name)
                            .font(.custom("Cairo-Medium", size: geometry.size.width > 600 ? 24 : 20))
                            .padding(.top, -30)
                            .foregroundColor(.black)
                        
                        // Search bar
                        SearchBar(text: $searchText)
                            .padding(.horizontal, 20)
                            .font(Font.custom("Cairo-Regular", size: 16 ))
                        
                        Spacer().frame(height: 10)
                        
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(filteredItems) { item in
                                    VStack {
                                        Image(item.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(
                                                width: geometry.size.width > 600 ? 140 : 100,
                                                height: geometry.size.width > 600 ? 180 : 120
                                            )
                                            .padding(1)
                                            .onTapGesture {
                                                addItem(item,  modelContext: modelContext)
                                            }
                                        
                                        Text(item.name)
                                            .font(.custom("Cairo-Bold", size: geometry.size.width > 600 ? 16 : 14))
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(
                                        width: geometry.size.width > 600 ? 160 : 120,
                                        height: geometry.size.width > 600 ? 200 : 150
                                    )
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                NavigationLink(destination: SchedulePageView(scheduleViewModel: scheduleViewModel)) {
                                    HStack {
                                        Image(systemName: "list.bullet.rectangle")
                                            .font(.title2)
                                        Text("\(scheduleViewModel.schedule.count)")
                                            .font(.headline)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
    }
        
        
        func addItem(_ item: ScheduleItem, modelContext: ModelContext) {
            if !scheduleViewModel.schedule.contains(where: { $0.id == item.id }) {
                scheduleViewModel.schedule.append(item)
                modelContext.insert(item)
                
                do{
                    try modelContext.save()
                    
                }catch {
                    print("Error saving context: \(error)")
                }
                
            }
        }
    }





#Preview {
    let scheduleViewModel = ScheduleViewModel()
    let sampleCategory = Category(
        name: "Sample Category",
        image: "star",
        items: [
            ScheduleItem(id: UUID(), name: "Sample Item 1", image: "sunny"),
            ScheduleItem(id: UUID(), name: "Sample Item 2", image: "sunny")
        ]
    )
    
    return CategoryItemsView(
        category: sampleCategory,
        scheduleViewModel: scheduleViewModel
    )
}

