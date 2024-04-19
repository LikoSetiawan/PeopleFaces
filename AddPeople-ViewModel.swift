////
////  AddPeople-ViewModel.swift
////  PeopleFaces
////
////  Created by Liko Setiawan on 18/04/24.
////
//
//import CoreImage
//import Foundation
//import SwiftUI
//import PhotosUI
//
//extension AddPeopleView{
//    @Observable
//    class ViewModel{
//        var processedImage: UIImage?
//        
//    
//        func loadImage(selectedImage: PhotosPickerItem?){
//            Task{
//                guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else { return }
//                
//                guard let inputImage = UIImage(data: imageData) else { return }
//                
//                processedImage = inputImage
//
//            }
//        }
//
//        
//    }
//}
