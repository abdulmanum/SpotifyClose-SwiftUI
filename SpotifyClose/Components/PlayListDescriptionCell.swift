//
//  PlayListDescriptionCell.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 28/06/2024.
//

import SwiftUI

struct PlayListDescriptionCell: View {
    
    var description: String = Product.mock.description
    var userName: String = "Abdul"
    var subHeadLine: String = "Laptop"
    
    var onAddToPlayListPressed: (() -> Void)? = nil
    var pressed2: (() -> Void)? = nil
    var pressed3: (() -> Void)? = nil
    var pressed4: (() -> Void)? = nil
    var pressed5: (() -> Void)? = nil
    var pressed6: (() -> Void)? = nil
    
    var body: some View {
            
        VStack(alignment: .leading, spacing: 8){
            
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            madeForYouSection
            
            Text(subHeadLine)
            
            buttonRow
                
        }
        .font(.callout)
        .foregroundStyle(.plightGray)
        
    }
    
    private var buttonRow: some View {
        HStack {
            HStack(spacing: 0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .asButton(.press) {
                        //
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .asButton(.press) {
                        //
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .asButton(.press) {
                        //
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .asButton(.press) {
                        //
                    }
            }
            .offset(x: -8)
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0){
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .padding(8)
                    .asButton(.opacity) {
                        //
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 34))
                    .asButton(.opacity) {
                        //
                    }
            }
            .foregroundStyle(.pgreen)
            
        }
    }
    
    private var madeForYouSection: some View {
            HStack(spacing: 8){
                Image(systemName: "applelogo")
                    .foregroundStyle(.pgreen)
                Text("Made for ") + Text(userName).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
    }
    
}

#Preview {
    ZStack{
        Color.pblack.ignoresSafeArea()
        
            PlayListDescriptionCell()
            .padding()
    }
}


