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
    
    private init(){}
    
    private var storage : [Int : Post] = [:]
    
    
    func create(_ post : Post ) {
        storage[post.postId] = post
    }
    
    func getPost(_ postId : Int ) -> Post? {
        
       return storage[postId]
        
    }
    
    func update(_ post : Post , _ content: String){
        storage[post.postId]?.content = content
    }
    
    func delete(_ postId : Int) {
        storage[postId] = nil
    }
    
    func getAllPosts() -> [Post] {
        return Array(storage.values)
    }
    
}
