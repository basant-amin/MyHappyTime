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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



#Preview  {
    let scheduleViewModel = ScheduleViewModel()
    scheduleViewModel.schedule = [
        ScheduleItem(id: UUID(), name: "Scheduled Item 1", image: "checkmark.circle"),
        ScheduleItem(id: UUID(), name: "Scheduled Item 2", image: "checkmark.circle.fill")
    ]
    
    return SchedulePageView(scheduleViewModel: scheduleViewModel)
}
