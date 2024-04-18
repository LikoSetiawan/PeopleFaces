//
//  AddPeople-ViewModel.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 18/04/24.
//

import CoreImage
import Foundation
import SwiftUI
import PhotosUI

extension AddPeopleView{
    @Observable
    class ViewModel{
        var processedImage: UIImage?
        var name = ""
        var people: [People]
        
        init(people: People){
            name = people.name
            if let image = UIImage(data: people.image) {
                    processedImage = image
                } else {
                    // Handle the case where image data cannot be converted to UIImage
                    print("Error: Unable to create UIImage from image data")
                }
            self.people = [people]
        }
        
        let savePath = URL.documentsDirectory.appending(path: "People")
        
        func loadImage(selectedImage: PhotosPickerItem?){
            Task{
                guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else { return }
                
                guard let inputImage = UIImage(data: imageData) else { return }
                
                processedImage = inputImage

            }
        }
        
        func savePeople() {
            do{
                let data = try JSONEncoder().encode(people)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func addPeople(){
            if let imageData = processedImage?.jpegData(compressionQuality: 0.8){
                let addNewPeople = People(id: UUID(), name: "", image: imageData)
                people.append(addNewPeople)
            }
        }
        
    }
}
