//
//  LikePost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//


struct LikePost {
    
    static func addLike(_ posts: [Post]?) {
        
        guard PostAvailablity.checkPostAvailability(posts) == true else {
            print("No Post Available .... ")
            return
        }
        
        print("Enter a Post Number to Like: ",terminator: "")
        
        guard let postNumber = Int(readLine() ?? "-1") else {
            print("Post Number Not Correct")
            return
        }
        
        guard let posts = posts , postNumber >= 1 && postNumber-1 < posts.count  else {
            
            print("Invalid Post Number..")
            
            return
        }
        
        let post = posts[postNumber-1]
        
    
        let result = PostService.shared.addLike(post)
        
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
        guard PostAvailablity.checkPostAvailability(posts) == true else {
            print("No Post Available .... ")
            return
        }
        print("Enter a Post Number to Like: ",terminator: "")
        
        guard let postNumber = Int(readLine() ?? "-1") else {
            print("Post Number Not Correct")
            return
        }
        
        guard let posts = posts , postNumber >= 1 && postNumber-1 < posts.count  else {
            
            print("Invalid Post Number..")
            
            return
        }
        
        let post = posts[postNumber-1]
        
        
        let result = PostService.shared.removeLike(post)
        
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


