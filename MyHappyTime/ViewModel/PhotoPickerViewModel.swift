//
//  PhotoPickerViewModel.swift
//  MyHappyTime
//
//  Created by basant amin bakir on 12/12/2024.
//
import SwiftUI
import PhotosUI
@MainActor

final class PhotoPickerViewModel: ObservableObject {
    @Published var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil{
        
        didSet {
            setImage(from: imageSelection)
        }
    }
    
    
    func setImage(from selection: PhotosPickerItem?){
        guard let selection else { return }
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self){
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
        }
        
    }
    
}



