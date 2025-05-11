//
//  HomeView.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting


//@Observable
//final class HomeViewModel {
//    
//    let router: AnyRouter
//    
//    var currentUser: User? = nil
//    
//    var selectedCategory: Category? = nil
//    
//    var products: [Product] = []
//    var productRows: [ProductRow] = []
//    
//    private func getData() async {
//        
//        guard viewModel.products.isEmpty else { return }
//        
//        do{
//            currentUser = try await DatabaseHelper().getUsers().first
////            products = try await DatabaseHelper().getProducts()
//            products = try await Array(DatabaseHelper().getProducts().prefix(8))
//            
//            var rows: [ProductRow] = []
//            let allBrands = Set(products.map { $0.brand }) // set not make the duplicate values
//            for brand in allBrands {
////                let prdts = self.products.filter({$0.brand == brand})
//                let prdts = products
//                rows.append(ProductRow(title: brand!.capitalized, products: prdts))
//            }
//            
//            productRows = rows
//            
//            
//        } catch{
//            //
//        }
//    }
//    
//}

struct HomeView: View {
    
    @Environment(\.router) var router
    
    @State private var currentUser: User? = nil
    
    @State private var selectedCategory: Category? = nil
    
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack{
            Color.pblack.ignoresSafeArea()
        
            ScrollView { 
                
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders] , content: {
                    
                    Section {
                        
                        VStack(spacing: 16){
                            
                            recentSection
                                .padding(.horizontal, 16)
                            
                            if let firstProduct = products.first{
                                newReleaseSection(firstProduct: firstProduct)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                            
                        }
                        
                        
                    } header: {
                        header
                    }
                    
                })
                .padding(.top)
                
                
            }
            .scrollIndicators(.hidden)
            .clipped()
           
            
            
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
        
    }
    
    private var listRows: some View {
        ForEach(productRows) { productRow in
            VStack(spacing: 8){
                Text(productRow.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.pwhite)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.horizontal, 16)
             
                ScrollView(.horizontal){
                    HStack(alignment: .top, spacing: 8) {
                        ForEach(productRow.products){ product in
                            ImageTitleRowCell(image: product.firstImage, title: product.title, imageSize: 120)
                                .asButton(.opacity) {
                                    goToPlayListView(product: product)
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private func newReleaseSection(firstProduct: Product) -> some View {
        ReleaseCell(imageName: firstProduct.firstImage,
                    headline: firstProduct.brand,
                    subheadline: firstProduct.category,
                    title: firstProduct.title,
                    subtitle: firstProduct.description,
                    onAddToPlayList: nil,
                    onPlayVideo: {
                        goToPlayListView(product: firstProduct)
                    })
    }
    
    private var recentSection: some View{
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 12, items: products) { product in
            if let product {
                RecentCell(image: product.firstImage, text: product.title)
                    .asButton(.press) {
                        goToPlayListView(product: product)
                    }
            }
        }
    }
    
    ///This is header
    private var header: some View {
        HStack(spacing: 0){
            
            ZStack{
                if let currentUser {
                    ImageLoaderView(imageUrl: currentUser.image, resizableMode: .fill)
                        .background(.pwhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 40, height: 40)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8 ){
                    ForEach(Category.allCases, id: \.self){ category in
                        CategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.pblack)
    }
    
    
    private func goToPlayListView(product: Product){
        guard let currentUser else { return }
        router.showScreen(.push){ _ in
            PlayListView(product: product, user: currentUser)
        }
    }
    
    private func getData() async {
        
        guard products.isEmpty else { return }
        
        do{
            currentUser = try await DatabaseHelper().getUsers().first
//            products = try await DatabaseHelper().getProducts()
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand }) // set not make the duplicate values
            for brand in allBrands {
//                let prdts = self.products.filter({$0.brand == brand})
                let prdts = products
                rows.append(ProductRow(title: brand!.capitalized, products: prdts))
            } 
            
            productRows = rows
            
            
        } catch{
            //
        }
    }
    
}

#Preview {
    RouterView{ _ in
        HomeView()
    }
}
