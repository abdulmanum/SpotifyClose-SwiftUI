//
//  ActivityLoader.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 28/06/2024.
//

import SwiftUI

struct ActivityLoader: View {
    var isLoaderShow: Bool = true
    var body: some View {
        if isLoaderShow { ZStack { ProgressView {} .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.height / 3.5) }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center) .background(Color.black.opacity(0.25).edgesIgnoringSafeArea(.all)) } } }

#Preview {
    ActivityLoader()
}
