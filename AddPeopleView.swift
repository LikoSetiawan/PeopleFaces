//
//  AddPeopleView.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 18/04/24.
//

import CoreImage
import SwiftUI
import PhotosUI

struct AddPeopleView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedImage: PhotosPickerItem?
    @State private var processedImage: Image?

    @State private var name = ""
//    var people: People
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                PhotosPicker(selection: $selectedImage){
                    if let processedImage {
                        
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedImage, loadImage)
                .buttonStyle(.plain)
                
                Spacer()
            
                TextField("Name the people", text: $name)
                    .padding()
                    .background(Color.white) // Set background color
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1) // Add border
                        )
                    .cornerRadius(10) // Apply rounded corners
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    .frame(width: 370)
            }
            .navigationTitle("Add People Faces")
            .padding([.horizontal, .bottom])
            .toolbar{
                Button("Save People"){
                    //
                    dismiss()
                }
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .bold()
                .buttonStyle(.plain)
            }
        }
    }
    func loadImage(){
        Task{
            guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else { return }
            
            guard let inputImage = UIImage(data: imageData) else { return }
            
            processedImage = Image(uiImage: inputImage)

            
            
        }
    }
    
    func savePeople() {
        if let imageData = selectedImage?.loadTransferable(type: Data.self){
            
        }
        
        guard let inputImage = UIImage(data: imageData) else { return }
        //usedocumentdirectory here's the reference code
//        Button("Read and Write") {
//            let data = Data("Test Message".utf8)
//            let url = URL.documentsDirectory.appending(path: "message.txt")
//
//            do {
//                try data.write(to: url, options: [.atomic, .completeFileProtection])
//                let input = try String(contentsOf: url)
//                print(input)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
    }
    
}

#Preview {
    AddPeopleView()
}

