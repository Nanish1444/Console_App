//
//  DeleteComment.swift
//  App
//
//  Created by Nanish A on 26/08/25.
//

struct DeleteComment {
    static func delete(_ comments : [Comment]) {
        
        guard Check.checkAvailability(comments) else {
            return
        }
        
        do {
            let userInput = try Input.userInput("delete comment number ")
            let commentNumber = Int(userInput)
            
            guard let commentNumber = commentNumber , commentNumber-1 >= 0 , commentNumber <= comments.count else {
                print("Invalid Comment Number")
                return
            }
            
            guard comments[commentNumber-1].userId == AuthService.shared.getCurrentUser()!.userId else{
                print("You can't delete the comment , It's not yours")
                return
            }
            let comment = comments[commentNumber-1]
            
            Confirmation.perform(label: "Comment",
                                 performLabel: "deleted",
                                 status: ActionStatus.getStatus,
                                 action: CommentService.shared.deleteComment(comment))
            
            return
        }
        catch{
            printInvalidInput()
        }
    }
    
}
