//
//  PlayListHeaderCell.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI
import SwiftfulUI

struct PlayListHeaderCell: View {
    
    var title: String = "Some playlist title goes here"
    var subTitle: String = "Some Sub title"
    var imageName: String = Const.randomImage
    var shadowColor: Color = .pblack.opacity(0.8)
        
    var body: some View {
        
        Rectangle()
            .opacity(0)
            .overlay(content: {
                ImageLoaderView(imageUrl: imageName)
                    .overlay(
                        VStack(alignment: .leading, spacing: 8){
                            Text(subTitle.capitalized)
                                .font(.headline)
                            Text(title)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        .foregroundStyle(.pwhite)
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                        )
                    , alignment: .bottomLeading
                        
                    )
            })
            .asStretchyHeader(startingHeight: 300)
        
    }
}

#Preview {
    ZStack{
        Color.pblack.ignoresSafeArea()
        
        ScrollView{
            PlayListHeaderCell()
        }
        .ignoresSafeArea()
    }
}
