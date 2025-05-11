//
//  ContentView.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        
        List{
            Button {
                router.showScreen(.fullScreenCover){ _ in
                    HomeView()
                }
            } label: {
                Text("Open App")
            }

        }
        
    }
    
        
}

#Preview {
    RouterView{ _ in
        ContentView()
    }
}
