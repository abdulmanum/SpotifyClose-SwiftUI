//
//  ImageLoaderView.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct ImageLoaderView: View {
    
    var imageUrl: String = Const.randomImage
    var resizableMode: ContentMode = .fill
    
    var body: some View {
        
        
        Rectangle()
            .overlay {
                WebImage(url: URL(string: imageUrl))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizableMode)
                    .allowsHitTesting(false)
            }
            .clipped()
        
            
        
        
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
