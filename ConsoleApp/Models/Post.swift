//
//  Post.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

struct Post {
    @IDGenerator(.post) var postId : String
    var userId : String
    var content : String
    var createdAt : String    
}
