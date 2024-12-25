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
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.slight
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // العنوان
                    Text("Categories")
                        .font(.custom("Cairo-Medium", size: geometry.size.width > 600 ? 28 : 20))
                        .padding(.top, geometry.size.height * 0.0)
                    
                    Divider()
                        .frame(width: geometry.size.width * 0.8, height: 2)
                        .background(Color.mainBlue)
                        .padding(.bottom, geometry.size.height * 0.0)
                    
                    // المحتوى
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.categories) { category in
                                NavigationLink(destination: CategoryItemsView(category: category, scheduleViewModel: viewModel)) {
                                    VStack {
                                        Image(category.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.1)
                                            .cornerRadius(10)
                                        
                                        Text(category.name)
                                            .font(.custom("Cairo-Medium", size: geometry.size.width > 600 ? 16 : 14))
                                            .foregroundColor(viewModel.textColorForCategory(category))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(viewModel.colorForCategory(category), lineWidth: 2)
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // زر صور مخصصة
                        NavigationLink(destination: CustomPhotoPickView(scheduleViewModel: viewModel)) {
                            HStack {
                                Image(systemName: "photo.on.rectangle")
                                    .font(.system(size: 24))
                                    .foregroundColor(.blue)
                                
                                Text("Custom Phote")
                                    .font(.custom("Cairo-Medium", size: 20))
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        }
                        .padding(.vertical, 10)
                    }
                }
                .padding(.horizontal, geometry.size.width > 600 ? 40 : 16)
            }
        }
    }
}

#Preview {
    CategoryPageView()
}
