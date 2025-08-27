//
//  Comment.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//


struct Comment {
    @IDGenerator(.comment) var commentId : String
    var postId: String
    var userId: String
    var content: String
}
