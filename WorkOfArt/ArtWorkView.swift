//
//  ArtWorkView.swift
//  WorkOfArt
//
//  Created by nika razmadze on 22.12.23.
//

import SwiftUI

struct ArtWorkView: View {
    var art: ArtModel
    
    var body: some View {
        Image(art.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 200)
            .background(art.backgroundColor.opacity(0.2))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
            .scaleEffect(0.8)
    }
}

#Preview {
    ArtWorkView(art: ArtModel(imageName: "fifth", backgroundColor: Color.gray ))
}
