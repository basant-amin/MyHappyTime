//
//  CustomPhotoPickView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 17/12/2024.
//

import SwiftUI
import PhotosUI

struct CustomPhotoPickView: View {
    let columnadaptive: [GridItem] = [
        GridItem(.adaptive(minimum: 160), spacing: 15)
    ]
    
    @ObservedObject var scheduleViewModel: ScheduleViewModel
    @StateObject var photoModel = PhotoPickerViewModel()
    
    var body: some View {
        NavigationStack {
     ZStack {
         Color.slight
             .edgesIgnoringSafeArea(.all)
         VStack {
             Text("Photo Picker Grid")
                 .font(.title)
                 .bold()
             
             LazyVGrid(columns: columnadaptive, spacing: 15) {
                 ForEach(photoModel.selectedImages, id: \.self) { image in
                     ZStack {
                         Image(uiImage: image)
                             .resizable()
                             .scaledToFill()
                             .frame(width: 160, height: 160)
                             .cornerRadius(10)
                             .clipped()
                             .opacity(scheduleViewModel.addedImages.contains(image) ? 0.5 : 1.0)
                             .onTapGesture {
                                 if !scheduleViewModel.addedImages.contains(image) {
                                     scheduleViewModel.addImage(image)
                                 }
                             }
                         
                         if scheduleViewModel.addedImages.contains(image) {
                             Image(systemName: "checkmark.circle.fill")
                                 .resizable()
                                 .foregroundColor(.white)
                                 .frame(width: 30, height: 30)
                                 .offset(x: 60, y: -60)
                         }
                     }
                 }
             }
             .padding()
             
             PhotosPicker(selection: $photoModel.imageSelection, matching: .images, photoLibrary: .shared()) {
                 Text("Select Photos")
                     .font(.headline)
                     .foregroundColor(.white)
                     .padding()
                     .background(Color.mainBlue)
                     .cornerRadius(10)
             }
         }
         .navigationBarBackButtonHidden(true)
         .navigationTitle("Custom Photo")
         .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
                 NavigationLink(destination: SchedulePageView(scheduleViewModel: scheduleViewModel)) {
                     Image(systemName: "list.bullet.rectangle")
                         .font(.title2)
                         .foregroundStyle(.mainBlue)
                 }
             }
         }
     }
            }
    }
}



#Preview {
 
  CustomPhotoPickView(scheduleViewModel:  ScheduleViewModel())
}

