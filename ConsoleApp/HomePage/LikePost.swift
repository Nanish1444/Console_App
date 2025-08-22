//
//  LikePost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//


struct LikePost {
    
    static func addLike(_ posts: [Post]?) {
        
        print("Enter a Post Number to Like: ",terminator: "")
        
        let postNumber = Int(readLine() ?? "-1")!
        
        guard let posts = posts , postNumber >= 1 && postNumber-1 < posts.count  else {
            
            print("Invalid Post Number..")
            
            return
        }
        
        let post = posts[postNumber-1]
        
        let result = LikeService.shared.addLike(post.postId, post.userId)
        
        switch result {
            
        case .likeAdded :
            print("Like Added")
        case .likeRemove:
            print("Like Removed")
        case .alreadyLiked:
            print("AlreadyLiked")
        case .notLiked:
            print("You are not Liked")
        }
        
    }
}
