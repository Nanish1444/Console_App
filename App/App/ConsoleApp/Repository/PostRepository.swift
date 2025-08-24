import Foundation



enum PostError: Error {
    case postNotFound
    case cannotDeletePost               
    case cannotLikeOwnPost
    case alreadyLiked
    case postContentEmpty
    case maxPostLimitReached(max: Int)
}


class PostCRUD {
    
    static var sharedInstance = PostCRUD()
    
    private init(){
    }
    
    private var storage : [Int : Post] = [:]
    
    
    func create(_ post : Post ) {
        storage[post.postId] = post
    }
    
    func getPost(_ postId : Int ) -> Post? {
        
       return storage[postId]
        
    }
    
    func updateContent(_ post : Post , _ content: String){
        storage[post.postId]?.updateContent(content)
    }
    
    func addLike(_ postId : Int ,_ like : Like) -> LikeState{
        var post = storage[postId]!
        let res = post.addLike(like)
        storage[postId] = post
        return res
    }
    
    func removeLike(_ postId : Int ,_ userId : Int) -> LikeState{
        var post = storage[postId]!
        let res = post.removeLike(userId)
        storage[postId] = post
        return res
    }
    
    
    func delete(_ postId : Int) {
        storage[postId] = nil
    }
    
    func getAllPosts() -> [Post] {
        return Array(storage.values)
    }
    
    
    
    
   
}
