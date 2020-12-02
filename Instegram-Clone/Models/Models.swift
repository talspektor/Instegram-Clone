//
//  Models.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 25/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import Foundation

enum Gender {
    case male, female, other
}

public struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let profilPhoto: URL
    let bithdate: Date
    let gander: Gender
    let counts: UserCount
    let joinDate: Date
}

public struct UserCount {
    let fallowers: Int
    let fallowing: Int
    let posts: Int
}

public enum UsetPostType: String {
    case photo = "Photo"
    case video = "Video"
}

/// represent a user post
public struct UserPost {
    let identifier: String
    let postType: UsetPostType
    let postURL: URL //either video url or full video
    let caption: String?
    let likeCout: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUser: [String]
    let owner: User
}

public struct PostLike {
    let username: String
    let postIdentifier: String
}

public struct CommentLike {
    let username: String
    let commentIdentifier: String
}

public struct PostComment {
    let identifier: String
    let username: String
    let test: String
    let createdDate: Date
    let likes: [CommentLike]
}
