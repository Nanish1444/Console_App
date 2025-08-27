//
//  LikePost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//


struct LikePost {
    
    static func addLike(_ posts: [Post]) {
        
        repeat {
            do {
                let userInput = try Input.userInput("post number to like ")
                let postNumber = Int(userInput)
                guard let postNumber = postNumber , postNumber >= 1 && postNumber-1 < posts.count  else {
                    print("Invalid Post Number..")
                    return
                }
                let post = posts[postNumber-1]
                let result = PostService.shared.likePost(post.postId)
                switch result {
                case .likeAdded :
                    print("Like Added")
                    return
                case .alreadyLiked:
                    print("AlreadyLiked")
                    return
                default:
                    printInvalidInput()
                }
            }
            catch {
                printInvalidInput()
            }
        }while(true)
        
    }
    
    static func removeLike(_ posts: [Post]?) {
        repeat{
            do {
                
                let userInput = try Input.userInput("Post Number to remove like ")
                let postNumber = Int(userInput)
                
                guard let posts = posts ,let postNumber = postNumber , postNumber >= 1 && postNumber-1 < posts.count  else {
                    print("Invalid Post Number..")
                    return
                }
                
                let post = posts[postNumber-1]
                let result = PostService.shared.disLikePost(post.postId)
                
                switch result {
                case .likeRemove:
                    print("Like Removed")
                    return
                case .notLiked:
                    print("You are not Liked")
                    return
                default:
                    printInvalidInput()
                }
            }
            catch {
                printInvalidInput()
            }
        }while(true)
        
    }
}


