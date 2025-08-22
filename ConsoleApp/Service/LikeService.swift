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
    private var likeRepository = LikeCRUD.shared
    private init(){}
    
    
    func addLike(_ postId: Int, _ userId: Int) -> LikeState {
        if likeRepository.alreadyLiked(postId, userId) {
            return .alreadyLiked
        }
        let like = Like(postId: postId, userId: userId)
        likeRepository.addLike(like)
        return .likeAdded
    }
    
    func removeLike(_ postId : Int ,_ userId : Int ) -> LikeState {
        
        if likeRepository.alreadyLiked(postId, userId) {
            
            likeRepository.delete(postId,userId)
            
            return .likeRemove
        }
        
        return .notLiked
        
        
    }
    
    func totalLikes(_ postId: Int) -> Int {
        return likeRepository.totalLikes(postId)
    }
}
