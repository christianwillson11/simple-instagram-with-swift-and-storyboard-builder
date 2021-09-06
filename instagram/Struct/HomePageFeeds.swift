//
//  PostPage.swift
//  instagram
//
//  Created by Christian Willson on 31/08/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import Foundation

//ini adalah modelnya
//bukan lagi pakai array tapi pakai struct

struct Post {
    var profilePicture: String
    var username: String
    var photos: [String]
    var description: String
    
    
    static func fetchPosts() -> [Post] {
        var posts = [Post]()
        
        let myArray = ["image1", "image2", "image3"]
        let myArray2 = ["image3", "image2", "image1"]
        let x = Post(profilePicture: "test1", username: "Anna Haro", photos: myArray, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla.")
        let y = Post(profilePicture: "test2", username: "Justin Bieber", photos: myArray2, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus placerat turpis cursus auctor. Nulla.")
        
        posts.append(x)
        posts.append(y)
        
        return posts
        
    }
}
