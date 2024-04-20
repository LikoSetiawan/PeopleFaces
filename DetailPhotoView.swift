//
//  DetailPhotoView.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 20/04/24.
//

import SwiftUI
import MapKit

struct DetailPhotoView: View {
    
    let people: People
    @State private var selectedTab = 0
    
    var body: some View {
        VStack{
            if selectedTab == 0 {
                if people.image != nil {
                    if let uiImage = UIImage(data: people.image) {
                        let image = Image(uiImage: uiImage)
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    }
                }
            } else {
                Map(){
                    Annotation("Photos taken from here", coordinate: people.coordinate){
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)

                    }
                }
            }
            
            Spacer()
            
            Picker("Photos or Map", selection: $selectedTab){
                Text("Photos")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(.segmented)
        }
  
        
    }
}

#Preview {
    DetailPhotoView(people: .example)
}
