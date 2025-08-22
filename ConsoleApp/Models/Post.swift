//
//  Post.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

struct Post {
@IDGenerator var postId : Int
    var userId : Int
    var content : String
    var createdAt : String
    
    init(userId: Int, content: String, createdAt: String) {
        self.postId = 0 
        self.userId = userId
        self.content = content
        self.createdAt = createdAt
    }
    
}
