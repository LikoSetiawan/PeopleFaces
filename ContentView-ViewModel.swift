//
//  ContentView-ViewModel.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 18/04/24.
//

import CoreImage
import CoreLocation
import Foundation
import MapKit
import SwiftUI
import PhotosUI

extension ContentView{
    @Observable
    class ViewModel{
        private(set) var peoples: [People]
        var addPhotoModal = false
        
        var processedImage: UIImage?
        
        let savePath = URL.documentsDirectory.appending(path: "People")
        
        init(){
            do{
                let data = try Data(contentsOf: savePath)
                peoples = try JSONDecoder().decode([People].self, from: data)
            } catch{
                peoples = []
            }
        }
        
        func savePeople() {
            do{
                let data = try JSONEncoder().encode(peoples)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
                print("People data saved successfully.")
            } catch {
                print("Unable to save data")
            }
        }
        
        func addPeople(name: String, point: CLLocationCoordinate2D ){
            if let imageData = processedImage?.jpegData(compressionQuality: 0.8){
                let addNewPeople = People(id: UUID(), name: name, image: imageData, latitude: point.latitude, longitude: point.longitude)
                peoples.append(addNewPeople)
                savePeople()
                
                processedImage = nil
                print("New person added successfully.")
            }
        }
        
        func loadImage(selectedImage: PhotosPickerItem?){
            Task{
                guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else { return }
                
                guard let inputImage = UIImage(data: imageData) else { return }
                
                processedImage = inputImage

            }
        }
        
    }
}
