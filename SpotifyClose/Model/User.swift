//
//  User.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import Foundation


struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let height, weight: Double
    
    static var mock: User{
        User(
            id: 1,
            firstName: "Abdul",
            lastName: "Manum",
            age: 27,
            email: "abdulmanumit@gmail.com",
            phone: "9787789978",
            username: "abdulmanum",
            password: "111",
            birthDate: "",
            image: Const.randomImage,
            height: 2.0,
            weight: 2.0
        )
    }
    
}
