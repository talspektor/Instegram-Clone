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
    let name: (first: String, last: String)
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

public enum UsetPostType {
    case photo, video
}

/// represent a user post
public struct UserPost {
    let identifier: String
    let postType: UsetPostType
    let thumbNailImage: URL //either video url or full video
    let caption: String?
    let likeCout: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUser: [String]
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
    let likes: CommentLike
}
