//
//  FriendsList.swift
//  vk-client
//
//  Created by i.vasilyev on 19.02.2021.
//

import UIKit

struct User {
    let name: String
    let avatar: UIImage?
    let arrayImages: [(UIImage?,Int)]    
}

struct FriendSection {
    let title: Character
    let arrayUser: [User?]
}
