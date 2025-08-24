//
//  ViewPost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//
import Foundation




struct ViewPost {
    static func view() {
        let pending = PostService.shared.getAllPosts()
        var showPost = ShowService(pendingItem: pending)
        viewContent()
        
        repeat {
            
            let currentPost = showPost.current()
            showCurrentPost(currentPost)
            
            print("Enter Your Input Here : ",terminator: "")
            
            let option = ViewPostOption.fromInput(readLine())
            
            switch option {
            case .previous:
                checkStatus(showPost.previous())
                sleep(1)
                
            case .next:
                checkStatus(showPost.next())
                sleep(1)
                
            case .like:
                LikePost.addLike(currentPost)
                sleep(1)
            case .dislike:
                LikePost.removeLike(currentPost)
            case .viewComment:
                ViewComment.view(currentPost)
                sleep(1)
            case .addComment:
                ViewComment.addComment(currentPost)
               
            case .back:
                return
            default:
                print("Invalid Input , Try Again")
                sleep(1)
                
            }
            
            
        }while(true)
    }
    
    static func showCurrentPost(_ posts : [Post]?) {
        
        guard let posts = posts else {
            return
        }
        
        var index = 1
        print("========================================================")
        for post in posts {
            print("""
                PostNumber :  \(index)                     
                
                UserId : \(post.userId)
                                
                
                Content : \(post.content)
                
                
                Likes: \(PostService.shared.totalLikes(post.postId))
                
                
                Post Created : \(post.createdAt)
                
                """)
            usleep(300_000)
            index += 1
            print("========================================================")
        }
    }
    
    
    
    static func checkStatus(_ status : Availablity){
        switch status {
        case .noNext:
            print("No Next Post")
        case .noPrevious:
            print(" No Previous Post")
        default:
            return
        }
        
    }
     
    
}

func viewContent() {
    print("""
    =============================
    📄  Post Menu
    =============================

    Choose an option below ⬇️
    1️⃣  Previous Post  
    2️⃣  Next Post  
    3️⃣  Like this Post ❤️  
    4️⃣  Dislike this Post 👎  
    5️⃣  View Comments 💬  
    6️⃣  Add Comment ✍️  
    7️⃣  Back to Home Page 🏠
    
    """)
}
