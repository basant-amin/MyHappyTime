//
//  SchedulePageView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 07/12/2024.
//

import SwiftUI
import SwiftData
struct SchedulePageView: View {
    @Environment(\.modelContext) var modelContext
    @ObservedObject var scheduleViewModel: ScheduleViewModel
    @Query var scheduleItems: [ScheduleItem]
    @Query var customImage: [CustomImagePicker]
    var body: some View {
        NavigationStack {
            ZStack {
                Color.slight
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(" الجدول")
                        .font(.custom("Cairo-Medium", size: 25))
                    Divider()
                        .background(Color.sgreen)
                        .padding(.bottom, 10)
                        .padding(.vertical, 1)
                        .padding(.horizontal, 50)
                  
                    List {
                        
                        ForEach(customImage, id: \.id) { image in
                            if let uiImage = image.image {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 220)
                                    .cornerRadius(20)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .listRowSeparator(.hidden)
                                    .padding(.vertical, 5)
                                    .swipeActions {
                                        Button(role: .destructive) {
                                            deleteImage(image,modelContext: modelContext)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                            }
                        }
                        if(scheduleItems.count > 0){
                            ForEach(scheduleItems) { item in
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 220)
                                    .cornerRadius(20)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .listRowSeparator(.hidden)
                                    .padding(.vertical, 5)
                                    .swipeActions {
                                        Button(role: .destructive) {
                                            deleteItem(item, modelContext: modelContext)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                            }
                        }
                  
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    .padding()
                    
                    
                }
                
            }
        }
        
    }
    
    private func deleteItem(_ item: ScheduleItem, modelContext: ModelContext) {
        if let index = scheduleItems.firstIndex(where: { $0.id == item.id }) {
            let itemToDelete = scheduleItems[index]
            modelContext.delete(itemToDelete)
            do {
                try modelContext.save()
            } catch {
                print("Error saving context after delete: \(error)")
            }
        }
    }
    
    
    private func deleteImage(_ item: CustomImagePicker, modelContext: ModelContext) {
        if let index = customImage.firstIndex(where: { $0.id == item.id }) {
            let imageToDelete = customImage[index]
            modelContext.delete(imageToDelete)
            do {
                try modelContext.save()
            } catch {
                print("Error saving context after delete: \(error)")
            }
        }
    }
    
    
}



#Preview  {
    let scheduleViewModel = ScheduleViewModel()
    scheduleViewModel.schedule = [
        
        ScheduleItem(id: UUID(), name: "Scheduled Item 3", image: "meal1"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 4", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 5", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 6", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 7", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 8", image: "sunny")
    ]
    
    return SchedulePageView(scheduleViewModel: scheduleViewModel)
}
