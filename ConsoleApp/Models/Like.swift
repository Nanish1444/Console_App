//
//  Like.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//

struct Like {
//    @IDGenerator var likeId : Int
    var postId: Int
    var userId: Int
    
    init(postId: Int, userId: Int) {
//        self.likeId = 0
        self.postId = postId
        self.userId = userId
    }
}
