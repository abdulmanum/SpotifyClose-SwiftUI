//
//  CategoryCell.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI

struct CategoryCell: View{
    
    var title: String = "Music"
    var isSelected: Bool = false
    
    var body: some View{
        
        Text(title)
            .font(.callout)
            .frame(minWidth: 30)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColor(isSelected: isSelected)
//            .foregroundStyle(isSelected ? .pblack : .pwhite)
//            .background(isSelected ? .pgreen : .pdarkGray)
            .cornerRadius(16)
    }
}

extension View {
    func themeColor(isSelected: Bool) -> some View{
        self
            .foregroundStyle(isSelected ? .pblack : .pwhite)
            .background(isSelected ? .pgreen : .pdarkGray)
    }
}

#Preview {
    ZStack{
        Color.pblack.ignoresSafeArea()
        
        VStack(spacing: 40){
            CategoryCell(title: "All",isSelected: true)
            CategoryCell(isSelected: false)
            CategoryCell()
            CategoryCell(isSelected: true)
        }
        
    }
}
