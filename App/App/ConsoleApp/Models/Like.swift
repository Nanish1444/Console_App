//
//  Like.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//

struct Like : Hashable {
    var postId: Int
    var userId: Int
    
    static func == (lhs: Like, rhs: Like) -> Bool {
        return lhs.postId == rhs.postId && lhs.userId == rhs.userId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(postId)
        hasher.combine(userId)
    }
   
}
