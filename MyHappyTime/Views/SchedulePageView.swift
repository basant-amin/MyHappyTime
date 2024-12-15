//
//  SchedulePageView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 07/12/2024.
//

import SwiftUI

struct SchedulePageView: View {
    @ObservedObject var scheduleViewModel: ScheduleViewModel
    var body: some View {
      
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
                 ForEach(scheduleViewModel.schedule) { item in
                     Image(item.image)
                         .resizable()
                         .scaledToFit()
                         .frame(width: 220, height: 220)
                         .cornerRadius(20)
                         .listRowInsets(EdgeInsets())
                         .frame(maxWidth: .infinity, alignment: .center)
                         .listRowSeparator(.hidden)
                         .padding(.vertical, 5)
                         .swipeActions {
                             Button(role: .destructive){
                                 print("Delete")
                             }label: {
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



#Preview  {
    let scheduleViewModel = ScheduleViewModel()
    scheduleViewModel.schedule = [
        ScheduleItem(id: UUID(), name: "Scheduled Item 1", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 2", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 3", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 4", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 5", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 6", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 7", image: "sunny"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 8", image: "sunny")
    ]
    
    return SchedulePageView(scheduleViewModel: scheduleViewModel)
}
