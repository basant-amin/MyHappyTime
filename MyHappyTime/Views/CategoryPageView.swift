//
//  CategoryPageView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 07/12/2024.
//

import SwiftUI

struct CategoryPageView: View {
    @StateObject var viewModel = ScheduleViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ZStack {
                Color.slight
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Photo Categories")
                        .font(.custom("Cairo-Medium", size: 30))
                        .padding()
                    
                    Divider()
                        .frame(width: 350, height: 1.8)
                        .background(Color.sblue)

                    Spacer()

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.categories) { category in
                                NavigationLink(destination: CategoryItemsView(category: category, scheduleViewModel: viewModel)) {
                                    VStack {
                                        Image(category.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 50)
                                            .cornerRadius(18)
                                        Text(category.name)
                                            .font(.custom("Cairo-Medium", size: 14))
                                            .fontWeight(.heavy)
                                            .foregroundColor(viewModel.textColorForCategory(category))
                                            .padding([.top, .bottom], 0.5)
                                    }
                                    .padding()
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(viewModel.colorForCategory(category), lineWidth: 3)
                                    )
                                }
                            }
                        }
                        .padding()
                    }

                    NavigationLink(
                        destination:CustomPhotoPickView(scheduleViewModel: viewModel)
                    ) {
                        HStack {
                        
                            Text("Custom Image")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.رحلاتترفيهية)
                        }
                        .padding()
                        .frame(maxWidth: 325, maxHeight: 70)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.رحلاتترفيهية, lineWidth: 3)
                        )
                    }
                    .padding([.top, .bottom], 20)
                }
            }
        }
    }
}

#Preview {
    CategoryPageView()
}
