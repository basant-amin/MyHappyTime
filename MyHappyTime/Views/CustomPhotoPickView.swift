//
//  CustomPhotoPickView.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 17/12/2024.
//

import SwiftUI
import PhotosUI
import SwiftData

struct CustomPhotoPickView: View {
    @Environment(\.modelContext) var modelContext
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
                 ForEach(photoModel.selectedImages, id: \.id) { image in
                     if let uiImage = image.image {
                         ZStack {
                             Image(uiImage: uiImage)
                                 .resizable()
                                 .scaledToFill()
                                 .frame(width: 160, height: 160)
                                 .cornerRadius(10)
                                 .clipped()
                                 .onTapGesture {
                                     if !scheduleViewModel.addedImages.contains(where: { $0.id == image.id }) {
                                         addImage(image, modelContext: modelContext)
                                     }
                                 }
                             
                             if scheduleViewModel.addedImages.contains(where: { $0.id == image.id }) {
                                 Image(systemName: "checkmark.circle.fill")
                                     .resizable()
                                     .foregroundColor(.white)
                                     .frame(width: 30, height: 30)
                                     .offset(x: 60, y: -60)
                             }
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
    
    
    func addImage(_ image: CustomImagePicker, modelContext: ModelContext) {
        if !scheduleViewModel.addedImages.contains(where: { $0.id == image.id }) {
            
            scheduleViewModel.addedImages.append(image)
            modelContext.insert(image)
            
            do{
                try modelContext.save()
            }catch let error{
                print("Error saving context: \(error)")
            }
            let scheduleItem = ScheduleItem(
                        id: image.id,
                        name: image.name,
                        image: image.id.uuidString
                    )
            scheduleViewModel.schedule.append(scheduleItem)
            modelContext.insert(scheduleItem)
            do{
                try modelContext.save()
            }catch let error{
                print("Error saving context: \(error)")
            }
        }
    }
    
    
    
    
//    func addImage(_ image: CustomImagePicker, modelContext: ModelContext) {
//        if !scheduleViewModel.addedImages.contains(where: { $0.id == image.id }) {
//
//            scheduleViewModel.addedImages.append(image)
//            modelContext.insert(image)
//
//            let scheduleItem = ScheduleItem(
//                id: image.id,
//                name: image.name,
//                image: image.id.uuidString
//            )
//            scheduleViewModel.schedule.append(scheduleItem)
//            modelContext.insert(scheduleItem)
//
//            do {
//                try modelContext.save()
//            } catch let error {
//                print("Error saving context: \(error)")
//            }
//        }
//    }

    
}



#Preview {
 
  CustomPhotoPickView(scheduleViewModel:  ScheduleViewModel())
}

