//
//  LikeService.swift
//  App
//
//  Created by Nanish A on 22/08/25.
//

enum LikeState {
    case likeAdded
    case likeRemove
    case alreadyLiked
    case notLiked
}
struct LikeService {
    
    
    
    static var shared = LikeService()
    
    private var postToUserLinker = Linker<Int,Int>()
    
    
    private init(){}
    
    
    func addLike(_ postId: Int, _ userId: Int) -> LikeState {
        
        if postToUserLinker.hasLink(ownerID: postId, memberID: userId) {
            
            return .alreadyLiked
        }
        
        postToUserLinker.addLink(ownerID: postId, memberID: userId)
        return .likeAdded
    }
    
    func removeLike(_ postId : Int ,_ userId : Int ) -> LikeState {
        
        if postToUserLinker.hasLink(ownerID: postId, memberID: userId) {
            postToUserLinker.removeLink(ownerID: postId, memberID: userId)
            return .likeRemove
        }
        
        return .notLiked
        
        
    }
    
    func totalLikes(_ postId: Int) -> Int {
        return postToUserLinker.totalLinks(ownerID: postId)
    }
   
}
