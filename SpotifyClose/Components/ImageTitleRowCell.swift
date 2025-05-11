//
//  ImageTitleRowCell.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var image: String = Const.randomImage
    var title: String = "iPhone 14 Pro Max"
    var imageSize: CGFloat = 100
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            ImageLoaderView(imageUrl: image)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .foregroundStyle(.plightGray)
                .lineLimit(2)
                .padding(4)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack{
        Color.pblack.ignoresSafeArea()
        
        ImageTitleRowCell()
        
    }
}
