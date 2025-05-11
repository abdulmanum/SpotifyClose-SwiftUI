//
//  ReleaseCell.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI

struct ReleaseCell: View {
    
    var imageName: String = Const.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    
    var onAddToPlayList: (() -> Void)? = nil
    var onPlayVideo: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(spacing: 16){
            
            HStack{
                ImageLoaderView(imageUrl: imageName, resizableMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading, spacing: 2){
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.plightGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .foregroundStyle(.pwhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                ImageLoaderView(imageUrl: imageName, resizableMode: .fill)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 22){
                    VStack(alignment: .leading, spacing: 2){
                        if let title {
                            Text(title)
                                .foregroundStyle(.pwhite)
                                .fontWeight(.semibold)
                        }
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.plightGray)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    
                    HStack{
                        Image(systemName: "plus.circle")
                            .foregroundColor(.plightGray)
                            .font(.title3)
                            .padding(4)
                            .background(.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlayList?()
                            }
                            .offset(x: -4) // its added due to padding. so that it align with the above texts
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.plightGray)
                            .font(.title)
                            
                    }
                    
                }
                .padding(.trailing, 8)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .themeColor(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayVideo?()
            }
            
        }
        
    }
    
    
    
}

#Preview {
    ZStack {
        
        Color.pblack.ignoresSafeArea()
        
        ReleaseCell()
            .padding(  )
    }
}
