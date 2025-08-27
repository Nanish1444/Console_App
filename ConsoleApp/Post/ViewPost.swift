//
//  ViewPost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//
import Foundation


struct ViewPost {
    private static let maxView = 10
    static func view() {
        let posts = PostService.shared.getAllPosts()
        
        guard Check.checkAvailability(posts) else {
            print("Post not available\n")
            return
        }
        var numberOfPost = posts.count
        
        if(posts.count>maxView){
            numberOfPost = Input.getValidCount("post")
        }
        
        var showPost = ShowService(allItems: posts, pageSize: numberOfPost)
        printViewContent(showPost.getPrevNextAvailability())
        showCurrentPost(showPost.current())
        
        repeat {
            
            do {
                
                let userInput = try Input.userInput("option")
                let option = ViewPostOption.getStatus(userInput)
                
                switch option {
                case .previous:
                    checkStatus(showPost.previous(), showPost.current(),showPost)
                    
                case .next:
                    checkStatus(showPost.next(), showPost.current(),showPost)
                    
                case .like:
                    LikePost.addLike(showPost.current())
                    printViewContent(showPost.getPrevNextAvailability())
                    showCurrentPost(showPost.current())
                    
                    
                case .dislike:
                    LikePost.removeLike(showPost.current())
                    printViewContent(showPost.getPrevNextAvailability())
                    showCurrentPost(showPost.current())
                    
                case .viewComment:
                    ViewComment.view(showPost.current())
                    printViewContent(showPost.getPrevNextAvailability())
                    showCurrentPost(showPost.current())
                    
                case .addComment:
                    AddComment.addComment(showPost.current())
                    printViewContent(showPost.getPrevNextAvailability())
                    showCurrentPost(showPost.current())
                    
                case .deletePost:
                    DeletePost.delete(showPost.current())
                    
                    let result = PostService.shared.getAllPosts()
                    showPost = ShowService(allItems: result, pageSize: numberOfPost)
                    
                    guard Check.checkAvailability(showPost.current()) else {
                        print("Post not available\n")
                        return
                    }
                    printViewContent(showPost.getPrevNextAvailability())
                    showCurrentPost(showPost.current())
                    
                case .back:
                    return
                    
                default:
                    printInvalidInput()
                }
                
            }
            catch {
                printInvalidInput()
            }
            
        } while true
    }
    
    
    static func showCurrentPost(_ posts: [Post]) {
        
        guard Check.checkAvailability(posts) else { return }
        
        var index = 1
        print("========================================================")
        
        for post in posts {
            print("""
                PostNumber : \(index)
                
                UserName   : \(AuthService.shared.getUser(.id(post.userId)).userName)
                
                Content    : \(post.content)
                
                Likes      : \(PostService.shared.totalLikeCount(post.postId))
                
                Post Created: \(post.createdAt)
                """)
            
            usleep(300_000)
            index += 1
            print("========================================================")
        }
    }
    
    
    static func checkStatus<T>(_ status: Availability, _ posts: [Post],_ showPost:ShowService<T>) {
        
        switch status {
        case .noNext:
            print("No Next Post")
        case .noPrevious:
            print("No Previous Post")
        case .available:
            printViewContent(showPost.getPrevNextAvailability())
            showCurrentPost(posts)
        }
    }
}






func printViewContent(_ available : (Bool,Bool)) {
print(#"""
=============================
📄  Post Menu
=============================
Choose an option below ⬇️

1️⃣  Previous Post\#(available.0 ? "" : "-> Not available")
2️⃣  Next Post\#(available.1 ? "" :"-> Not available")
3️⃣  Like Post ❤️
4️⃣  Dislike Post 👎
5️⃣  View Comments 💬
6️⃣  Add Comment ✍️
7️⃣  Delete Post
8️⃣  Back to Home Page 🏠
"""#)
}



func printInvalidInput(){
    print("Invalid Input , Try Again.... \n ")
}
