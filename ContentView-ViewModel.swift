//
//  ContentView-ViewModel.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 18/04/24.
//

import CoreImage
import Foundation
import PhotosUI

extension ContentView{
    @Observable
    class ViewModel{
        private(set) var peoples: [People]
        var addPhotoModal = false
        
        
        let savePath = URL.documentsDirectory.appending(path: "People")
        
        init(){
            do{
                let data = try Data(contentsOf: savePath)
                peoples = try JSONDecoder().decode([People].self, from: data)
            } catch{
                peoples = []
            }
        }
        
        
    }
}
