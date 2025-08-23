//
//  Like.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//

struct Like : Hashable {
    
    
    @IDGenerator var likeId : Int
    var postId: Int
    var userId: Int
    
    static func == (lhs: Like, rhs: Like) -> Bool {
        return lhs.likeId == rhs.likeId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(likeId)
    }
   
}
