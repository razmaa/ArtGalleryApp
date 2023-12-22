//
//  ArtGalleryView.swift
//  WorkOfArt
//
//  Created by nika razmadze on 22.12.23.
//

import SwiftUI

struct ArtGalleryView: View {
    @ObservedObject var viewModel = ArtGalleryViewModel()
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    @State private var offset: CGSize = .zero
    var scaleEffect:CGFloat{
        let max = UIScreen.main.bounds.width / 2
        let currentOffset = abs(offset.width)
        let percentage = currentOffset / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    ArtWorkView(art: viewModel.images[0])
                        .onTapGesture {
                            viewModel.changeBackgroundColor()
                        }
                    
                    ArtWorkView(art: viewModel.images[1])
                        .offset(offset)
                        .onLongPressGesture {
                            viewModel.toggleColorScheme()
                        }
                }
                
                HStack {
                    ArtWorkView(art: viewModel.images[2])
                        .offset(offset)
                        .gesture(
                            DragGesture()
                                .onChanged{ value in
                                    withAnimation(.spring()){
                                        offset = value.translation
                                    }
                                }
                            
                                .onEnded{ value in
                                    withAnimation(.spring()){
                                        offset = .zero
                                    }
                                }
                        )
                    
                    ArtWorkView(art: viewModel.images[3])
                        .rotationEffect(currentAmount + finalAmount)
                        .gesture(
                            RotationGesture()
                                .onChanged { angle in
                                    currentAmount = angle
                                }
                                .onEnded { angle in
                                    finalAmount += currentAmount
                                    currentAmount = .zero
                                }
                        )
                }
                .simultaneousGesture(
                    TapGesture(count: 3)
                        .onEnded({ _ in
                            viewModel.swapImages()
                        })
                )
                
                
                ArtWorkView(art: viewModel.images[4])
                    .scaleEffect(scale)
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ changedScale in
                                scale = changedScale.magnitude
                            })
                    )
            }
            .padding()
            .toolbar(content: {
                Button(action: {
                    viewModel.changeBackgroundOfView()
                }) {
                    Circle()
                        .fill(viewModel.colorOfCircle)
                        .frame(width: 30, height: 30)
                }
            })
        }
        .environment(\.colorScheme, viewModel.isDarkMode ? .dark : .light)
    }
}

#Preview {
    ArtGalleryView()
}
