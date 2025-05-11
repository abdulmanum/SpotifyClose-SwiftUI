//
//  SongRowCell.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 28/06/2024.
//

import SwiftUI

struct SongRowCell: View {
    
    var image: String = Const.randomImage
    var imageSize: CGFloat = 50
    var title: String = "iPhone 14 Pro"
    var category: String? = "Apple"
    var onCellPress: (() -> Void)? = nil
    var onOptionPress: (() -> Void)? = nil
    
    var body: some View {
        
        HStack(spacing: 8){
            
            ImageLoaderView(imageUrl: image)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.callout)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                if let category {
                    Text(category)
                        .font(.caption)
                }
            }
            .lineLimit(2)
            .foregroundStyle(.plightGray)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.callout)
                .padding(12)
                .foregroundStyle(.plightGray)
                .onTapGesture {
                    onOptionPress?()
                }
            
        }
        .frame(maxWidth: .infinity)
        .asButton(.opacity) {
            onCellPress?()
        }
        
    }
    
}

#Preview {
    
    ZStack{

        Color.pblack.ignoresSafeArea()
        
        SongRowCell()

    }
}
