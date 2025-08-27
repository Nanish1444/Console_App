//
//  ViewComment.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//
import Foundation

struct ViewComment {
    private static let maxView = 10
    static func view(_ posts : [Post]) {
        
        repeat {
            
            do {
                let userInput = try Input.userInput("post Number ")
                let postNumber = Int(userInput)
                guard let postNumber = postNumber, postNumber >= 0 && postNumber-1 < posts.count else {
                    print("Invalid PostNumber")
                    return
                }
                let post = posts[postNumber-1]
                let result = CommentService.shared.getAllComments(post.postId)
                
                
                switch result {
                case .success(let comment) :
                    
                    var numberOfComment = comment.count
                    
                    if(comment.count>maxView){
                         numberOfComment = Input.getValidCount("comment")
                    }
                    
                    showComments(post.postId,comment, numberOfComment)
                    return
                case .failure(let error):
                    print(error)
                    return
                }
            }
            catch {
                printInvalidInput()
            }
            
        }while(true)
    }
    
    static func showComments(_ postId:String,_ comment:[Comment] ,_ numberOfComment:Int) {
        
        var showComment = ShowService(allItems:comment, pageSize: numberOfComment)
        
        printCommentContent(showComment.getPrevNextAvailability())
        displayAllComment(showComment.current())
        
        repeat {
            
            do{
                
                let userInput = try Input.userInput("option")
                let option = ViewCommentOption.getStatus(userInput)
                
                switch option {
                    
                case .previous:
                    checkStatus(showComment.previous(),showComment.current(),showComment)
                case .next:
                    checkStatus(showComment.next(),showComment.current(),showComment)
                case .delete:
                    DeleteComment.delete(showComment.current())
                    do {
                        let result = try CommentService.shared.getAllComments(postId).get()
                        showComment = ShowService(allItems:result, pageSize: numberOfComment)
                        displayAllComment(showComment.current())
                    }
                    catch {
                        print("Comment Box isEmpty")
                        return 
                    }
                    
                case .back:
                    return
                case .none:
                    printInvalidInput()
                }
            }
            catch{
                printInvalidInput()
                continue
            }
            
        }while(true)
        
    }
    
    static func displayAllComment(_ comments:[Comment]){
        
        var index = 1
        
        print("=============================================")
        for comment in comments {
            print("""
                Comment Number : \(index)
                
                UserName : \(AuthService.shared.getUser(.id(comment.userId)).userName)
                
                comment : \(comment.content)
                
                """)
            print("=============================================")
            usleep(200_000)
            index += 1
        }
    }
    
    
    static func checkStatus<T>(_ status : Availability,_ comments : [Comment],_ showComment : ShowService<T>) {
        switch status {
        case .noNext:
            print("No Next Comment")
        case .noPrevious:
            print(" No Previous Comment")
        case .available:
            printCommentContent(showComment.getPrevNextAvailability())
            displayAllComment(comments)
            
        }
    }
}


func printCommentContent(_ available:(Bool,Bool)) {
    print("""
    =============================
    📄  Comment Menu
    =============================

    Choose an option below ⬇️
    
    1️⃣  Previous Comment \(available.0 ? "" : " -> Not available")
    2️⃣  Next Comment \(available.1 ? "" : " -> Not available")
    3️⃣  Delete Comment
    4️⃣  Back to View Post Page  📸
    
    """)
}
