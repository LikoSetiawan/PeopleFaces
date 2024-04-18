//
//  ContentView.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    //contentview-viewmodel
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.peoples){ people in
                HStack{
                    Text(people.name)
                }
                
            }
            .navigationTitle("People Faces")
            .toolbar{
                Button("Add People"){
                    viewModel.addPhotoModal.toggle()
                }
            }
            .sheet(isPresented: $viewModel.addPhotoModal) {
                AddPeopleView(people: viewModel.peoples)
            }
            
        }
    }
}



#Preview {
    ContentView()
}
