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
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color(.slight)
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        Spacer()

                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.3)
                            .padding()

                        Spacer(minLength: geometry.size.height * 0.05)

                        VStack(spacing: geometry.size.height * 0.02) {
                            NavigationLink(destination: SchedulePageView(scheduleViewModel: scheduleViewModel)) {
                                Text("View The Schedule")
                                    .font(.custom("Cairo-Medium", size: geometry.size.width > 600 ? 24 : 20))
                                    .frame(width: geometry.size.width * 0.8, height: 52)
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            
                            NavigationLink(destination: CategoryPageView()) {
                                Text("Make The Schedule")
                                    .font(.custom("Cairo-Medium", size: geometry.size.width > 600 ? 24 : 20))
                                    .frame(width: geometry.size.width * 0.8, height: 52)
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
}
struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
            .previewDevice("iPhone 16 Pro")
        MainPageView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
    }
}

