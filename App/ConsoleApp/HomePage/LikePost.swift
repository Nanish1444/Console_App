//
//  LikePost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//


struct LikePost {
    
    static func addLike(_ posts: [Post]?) {
        
        guard checkPostAvailability(posts) == true else {
            print("No Post Available .... ")
            return
        }
        
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
        case .alreadyLiked:
            print("AlreadyLiked")
        default:
            print("Invalid Input Move To View Post Page")
            return
        }
        
    }
    static func removeLike(_ posts: [Post]?) {
        guard checkPostAvailability(posts) == true else {
            print("No Post Available .... ")
            return
        }
        print("Enter a Post Number to Like: ",terminator: "")
        
        let postNumber = Int(readLine() ?? "-1")!
        
        guard let posts = posts , postNumber >= 1 && postNumber-1 < posts.count  else {
            
            print("Invalid Post Number..")
            
            return
        }
        
        let post = posts[postNumber-1]
        
        
        let result = LikeService.shared.removeLike(post.postId, post.userId)
        
        switch result {
        case .likeRemove:
            print("Like Removed")
        case .notLiked:
            print("You are not Liked")
        default:
            print("Invalid Input Move To View Post Page")
            return
        }
        
    }
}


func checkPostAvailability(_ post : [Post]?) -> Bool {
    guard let post = post else {
        return false
    }
    return !post.isEmpty
}
