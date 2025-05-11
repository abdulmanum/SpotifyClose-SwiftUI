//
//  RecentCell.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI

struct RecentCell: View {
    
    var image: String = Const.randomImage
    var text: String = "iP"
    
    var body: some View {
        
        HStack(spacing: 8){
            ImageLoaderView(imageUrl: image)
                .frame(width: 55, height: 55)
            
            Text(text)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor(isSelected: false)
        .cornerRadius(8)
        
    }
}

#Preview {
    ZStack{
        Color.pblack.ignoresSafeArea()
        
        VStack{
            
            HStack{
                RecentCell()
                RecentCell()
            }
            
            HStack{
                RecentCell()
                RecentCell()
            }
            
        }
        
    }
}
