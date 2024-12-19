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
    @State private var searchText = ""
    private var filteredItems: [ScheduleItem] {
        if searchText.isEmpty {
            return category.items
        } else {
            return category.items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        
        
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.slight.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    SearchBar(text: $searchText)
                        .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 10)
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(filteredItems) { item in
                                VStack {
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 120)
                                        .padding(1)
                                        .onTapGesture {
                                            scheduleViewModel.addItem(item)
                                        }
                                    
                                    Text(item.name)
                                        .font(.custom("Cairo-Medium", size: 16))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: 120, height: 150)
                                .background(Color.slight)
                                .cornerRadius(10)
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
            .navigationTitle(category.name)
            .navigationBarBackButtonHidden(true)
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

