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
            GeometryReader { geometry in
                ZStack {
                    Color.slight
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("The Schedule")
                            .font(.custom("Cairo-Medium", size: geometry.size.width > 600 ? 28 : 20))
                            .padding(.top, geometry.size.height * 0.0)
                        Divider()
                            .frame(width: geometry.size.width * 0.8, height: 2)
                            .background(Color.mainBlue)
                            .padding(.bottom, geometry.size.height * 0.0)
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
                                                print("Delete image")
                                            } label: {
                                                Image(systemName: "trash")
                                            }
                                        }
                                }
                            }
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
                                            print("Delete item")
                                        } label: {
                                            Image(systemName: "trash")
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
