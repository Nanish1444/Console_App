//
//  Comment.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//


struct Comment {
    @IDGenerator var commentId : Int
    var postId: Int
    var userId: Int
    var content: String
    
    init(postId: Int, userId: Int, content: String) {
        self.commentId = 0
        self.postId = postId
        self.userId = userId
        self.content = content
    }
}
