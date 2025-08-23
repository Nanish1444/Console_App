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

}
