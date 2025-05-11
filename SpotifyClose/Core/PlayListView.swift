//
//  PlayListView.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct PlayListView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    var user: User = .mock

    @State private var products: [Product] = []
    
    @State private var showHeader: Bool = false
        

    var body: some View {
        ZStack{
            
            Color.pblack.ignoresSafeArea()
            
            ScrollView {
                
                LazyVStack(spacing: 12){
                    
                    PlayListHeaderCell(title: product.title, subTitle: product.category, imageName: product.firstImage)
                        .readingFrame { frame in
                            showHeader = frame.maxY < 100
                        }
//                        .overlay(
//                            GeometryReader(content: { geometry in
//                                Text("")
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                    .background(.green)
//                            })
//                        )
                    
                    PlayListDescriptionCell(
                        description: product.description,
                        userName: user.firstName,
                        subHeadLine: product.category,
                        onAddToPlayListPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products){ product in
                        SongRowCell(image: product.firstImage, imageSize: 50, title: product.title, category: product.category, onCellPress: {
                            goToPlayListView(product: product)
                        },
                            onOptionPress: nil)
                            .padding(.leading, 16)
                    }
                    
                }
                
                
            }
            
           header
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header : some View{
        ZStack{
            Text(product.title)
                .font(.headline)
                .offset(y: showHeader ? 0 : -40)
                .padding(.vertical, 20)
                .opacity(showHeader ? 1 : 0)
                .frame(maxWidth: .infinity)
                .background(showHeader ? Color.pblack : Color.black.opacity(0.001))

        
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.pblack.opacity(0.7))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .asButton(.opacity) {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.pwhite)
        .animation(.smooth, value: showHeader)
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    
    private func goToPlayListView(product: Product){
        router.showScreen(.push){ _ in
            PlayListView(product: product, user: user)
        }
        
    }
    
    private func getData() async {
        do{
            products = try await DatabaseHelper().getProducts()
            print(products.count)
        } catch{
            //
        }
    }
    
}

#Preview {
    RouterView{ _ in
        PlayListView()
    }
}
