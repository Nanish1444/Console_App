//
//  AddComment.swift
//  App
//
//  Created by Nanish A on 26/08/25.
//

struct AddComment {
    
    static func addComment(_ posts :[Post]) {
        
        do {
            
            let userInput = try Input.userInput("postNumber")
            let postNumber = Int(userInput)
            
            guard let postNumber = postNumber , postNumber >= 0 && postNumber-1 < posts.count else {
                print("Invalid PostNumber")
                return
            }
            
            let post = posts[postNumber-1]
            
            do{
                let commentContent = try Input.userInput("comment")
                
                Confirmation.perform(label: "Comment",
                                     performLabel:"created",
                                     status: ActionStatus.getStatus,
                                     action: CommentService.shared.addComment(commentContent,post.postId) )
            }
            catch{
                printInvalidInput()
                return
            }
            
        }
        catch{
            printInvalidInput()
            return
        }
    }
    
   
    
}
