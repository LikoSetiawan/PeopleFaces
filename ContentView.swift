//
//  ContentView.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var addPhotoModal = false
    
    
    
    var body: some View {
        NavigationStack{
            List(viewModel.peoples, id: \.self){ people in
                HStack{
                    Text(people.name)
                }
                
            }
            .navigationTitle("People Faces")
            .toolbar{
                Button("Add People"){
                    addPhotoModal.toggle()
                }
            }
            .sheet(isPresented: $addPhotoModal){
                AddPeopleView()
            }
        }
    }
}

#Preview {
    ContentView()
}
