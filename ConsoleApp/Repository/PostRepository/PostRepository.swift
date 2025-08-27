import Foundation

class PostCRUD {
    
    static let sharedInstance = PostCRUD()
    private var storage : [String : Post] = [:]
    private var postLikes : Linker<String,String> = Linker()
    
    private init(){}
    
    func create(_ post : Post ) {
        storage[post.postId] = post
    }
    
    func addLike(_ postId : String , _ userId : String ) -> LikeState{
        if !postLikes.hasLink(ownerID: postId, memberID: userId) {
            postLikes.addLink(ownerID: postId, memberID: userId)
            return .likeAdded
        }
        return .alreadyLiked
    }
    
    func removeLike(_ postId : String , _ userId : String ) -> LikeState{
        if postLikes.hasLink(ownerID: postId, memberID: userId) {
            postLikes.removeMemberID(ownerID: postId, memberID: userId)
            return .likeRemove
        }
        return .notLiked
    }
    
    func getTotalLike(_ postId: String) -> Int {
        postLikes.totalLinks(ownerID: postId)
    }

    func deletePost(_ post : Post) {
        storage[post.postId] = nil
        CommentCRUD.shared.deleteAllPostComment(post.postId)
        postLikes.removeOwnerID(ownerID: post.postId)
    }
    
    func getAllPosts() -> [Post] {
        return Array(storage.values)
    }
    
}
