//
//  MainPageView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 07/12/2024.
//

//
//  MainPageView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 07/12/2024.
//

import SwiftUI

struct MainPageView: View {
    @StateObject var scheduleViewModel = ScheduleViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.slight)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 450, height: 410)
                        .padding()

                    Spacer(minLength: 50)

                    VStack(spacing: 16) {
                        NavigationLink(destination: CategoryPageView()) {
                            Text(" View The Schedule")
                                .frame(width: 354, height: 52)
                                .background(Color.mainBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }

                        NavigationLink(destination: CategoryPageView()) {
                            Text("Make The Schedual")
                                .frame(width: 354, height: 52)
                                .foregroundColor(.mainBlue)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainBlue, lineWidth: 2)
                                )
                        }
                    }
                    .padding()
                }
            }
        }    
    }
}


#Preview {
    MainPageView()
}
