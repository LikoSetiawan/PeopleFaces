//
//  ContentView.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 17/04/24.
//

import CoreImage
import SwiftUI
import PhotosUI

struct ContentView: View {
    //contentview-viewmodel
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.peoples.sorted()){ people in
                NavigationLink(value: people){
                    HStack{
                        if people.image != nil {
                            if let uiImage = UIImage(data: people.image) {
                                let image = Image(uiImage: uiImage)
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }
                        }
                        
                        Text(people.name)
                        
                    }
                }
            }
            .navigationDestination(for: People.self){ people in
                DetailPhotoView(people: people)
            }
            .navigationTitle("People Faces")
            .toolbar{
                Button("Add People"){
                    viewModel.addPhotoModal.toggle()
                }
            }
            .sheet(isPresented: $viewModel.addPhotoModal) {
                AddPeopleView(viewModel: viewModel)
                
            }
        }
    }
}





#Preview {
    ContentView()
}
