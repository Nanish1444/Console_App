//
//  ViewComment.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//
import Foundation

struct ViewComment {
    
    static func view(_ posts : [Post]?) {
        guard let posts = posts , !posts.isEmpty else {
            print("No Post Available")
            return
        }
        
        print("Enter a PostNumber Here For Comment :",terminator: "")
        let postNumber = Int(readLine() ?? "-1")!
        
        guard  postNumber >= 0 && postNumber-1 < posts.count else {
            print("Invalid PostNumber")
            return
        }
        let post = posts[postNumber-1]
        let result = CommentService.instance.getAllComments(post.postId)
        
        switch result {
            
        case .success(let comment) :
            
            var showComment = ShowService(pendingItem:comment)
            
            commentContent()
            
            repeat {
                displayAllComment(showComment.current())
                print("Enter Your Choice : ",terminator: "")
                let userInput = ViewCommentOption.fromInput(readLine())
                
                switch userInput {
                case .previous:
                    
                    checkStatus(showComment.previous())
                    sleep(1)
                    
                case .next:
                    
                    checkStatus(showComment.next())
                    sleep(1)
                    
                case .back:
                    
                    return
                    
                case .none:
                    
                    print("Invalid Input , Try Again.")
                    sleep(1)
                }
            }while(true)
            
            case .failure(let error):
                print(error)
                return
            
        }
        
        
        
        
        
    }
    static func addComment(_ posts :[Post]?) {
        
        guard checkPostAvailability(posts) == true else {
            print("No Post Available .... ")
            return
        }
        
        print("Enter a PostNumber Here For Add Comment :",terminator: "")
        
        let postNumber = Int(readLine() ?? "-1")!
        
        guard  postNumber >= 0 && postNumber-1 < posts!.count else {
            print("Invalid PostNumber")
            return
        }
        let post = posts![postNumber-1]
        
        print("Write Comment Here :",terminator: "")
        let comment = readLine() ?? ""
        CommentService.instance.addComment(comment,post.postId)
        print("Comment Added Successful.")
        sleep(1)
    }
    
    
    static func displayAllComment(_ comments:[Comment]?){
        guard let comments = comments else {
            return
        }
        var index = 1
        
        print("=============================================")
        for comment in comments {
            print("""
                Comment Number : \(index)
                
                UserName : \(comment.userId)
                
                comment : \(comment.content)
                
                """)
            print("=============================================")
            usleep(500_000)
            index += 1
        }
    }
    
    
    static func checkStatus(_ status : Availablity) {
        switch status {
        case .noNext:
            print("No Next Comment")
        case .noPrevious:
            print(" No Previous Comment")
        default:
            return
        }
    }
}


func commentContent() {
    print("""
    =============================
    📄  Post Menu
    =============================

    Choose an option below ⬇️
    
    1️⃣  Previous Comment
    2️⃣  Next Comment 
    3️⃣  Back to View Post Page  📸
    
    """)
}
