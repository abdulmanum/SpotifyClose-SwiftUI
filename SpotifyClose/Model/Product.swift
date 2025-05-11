//
//  Product.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import Foundation


struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let category: String
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Const.randomImage
    }

    static var mock: Product{
        Product(
            id: 1,
            title: "iPhone 14 Pro",
            description: "This is some iPhone desc...",
            price: 1500,
            discountPercentage: 0,
            rating: 5,
            category: "Mobile",
            stock: 0,
            tags: [],
            brand: "Apple",
            sku: "",
            weight: 0,
            images: [Const.randomImage,  Const.randomImage,  Const.randomImage],
            thumbnail: Const.randomImage
        )
    }
    
}


struct ProductRow: Identifiable {
    let id = UUID().uuidString
    var title: String
    var products: [Product]
}



