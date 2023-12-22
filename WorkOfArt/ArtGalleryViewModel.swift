//
//  ArtGalleryViewModel.swift
//  WorkOfArt
//
//  Created by nika razmadze on 22.12.23.
//

import SwiftUI

final class ArtGalleryViewModel: ObservableObject {
    @Published var images: [ArtModel] = [
        ArtModel(imageName: "first", backgroundColor: .gray.opacity(0.6)),
        ArtModel(imageName: "second", backgroundColor: .gray.opacity(0.6)),
        ArtModel(imageName: "third", backgroundColor: .gray.opacity(0.6)),
        ArtModel(imageName: "fourth", backgroundColor: .gray.opacity(0.6)),
        ArtModel(imageName: "fifth", backgroundColor: .gray.opacity(0.6))

    ]
    @Published var isDarkMode = false
    @Published var colorOfCircle = Color.blue
    @Published var backgroundColor = Color.white
    
    func changeBackgroundColor() {
        colorOfCircle = Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1))
    }
    
    func changeBackgroundOfView() {
        for index in images.indices {
            images[index].backgroundColor = colorOfCircle
        }
    }

    func toggleColorScheme() {
        isDarkMode.toggle()
    }
    
    func swapImages() {
        let first = Int.random(in: 0..<images.count)
        let second = Int.random(in: 0..<images.count)
        
        images.swapAt(first, second)
    }
}

