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
    @Published var selectedImages: [CustomImagePicker] = []
    @Published var imageSelection: [PhotosPickerItem] = [] {
        didSet {
            loadImages(from: imageSelection)
        }
    }
    
    func loadImages(from selections: [PhotosPickerItem]) {
            Task {
                for selection in selections {
                    if let data = try? await selection.loadTransferable(type: Data.self) {
                        let newImage = CustomImagePicker(
                            imageData: data,
                            name: "any"
                        )
                        selectedImages.append(newImage)
                    }
                }
            }
        }
    
    
    }
