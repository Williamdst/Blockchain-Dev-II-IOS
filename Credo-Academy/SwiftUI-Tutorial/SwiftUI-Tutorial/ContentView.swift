//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by Denzel Williams on 2/5/22.
//

import SwiftUI

// What we've done here is use an extension. Extensions allow us to add new functionality to an existing type, in this case the Image type. Extensions are basically like adding custom methods to pre-built classes. 
extension Image{
    func imageModifier() -> some View {
        self
          .resizable()
          .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        // Loads and displays an image, but the image isn't scaled properly and will be the same size as the original
        //AsyncImage(url: URL(string: imageURL))
        
        // Scales the image that was loaded
        //AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // Because the image takes a while to load, what we are doing in this block of code is customizing the placeholder that will show while the image is loading. AsyncImage creates an Image instance that you can modify. You can't modify the AsyncImage itself.
        AsyncImage(url: URL(string: imageURL)) { image in image.imageModifier()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModifier()
        }.padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
