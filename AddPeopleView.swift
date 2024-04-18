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
    //addpeople-viewmodel
    @State private var viewModel: ViewModel


    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                PhotosPicker(selection: $selectedImage){
                    if let processedImage = viewModel.processedImage {
                        Image(uiImage: processedImage)
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedImage){ 
                    viewModel.loadImage(selectedImage: selectedImage)
                }
                .buttonStyle(.plain)
                
                Spacer()
            
                TextField("Name the people", text: $viewModel.name)
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
                    viewModel.addPeople()
                    viewModel.savePeople()
                    dismiss()
                }
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .bold()
                .buttonStyle(.plain)
            }
        }
    }

    init(people: People){
        _viewModel = State(initialValue: ViewModel(people: people))
    }
  
    
}

#Preview {
    AddPeopleView(people: .example)
}

