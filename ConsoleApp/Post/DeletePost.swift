//
//  DeletePost.swift
//  App
//
//  Created by Nanish A on 26/08/25.
//

struct DeletePost {
    
    static func delete(_ posts : [Post]) {
        
        do {
            let userInput = try Input.userInput("delete post number ")
            let postNumber = Int(userInput)
            
            guard let postNumber = postNumber , postNumber-1 >= 0 , postNumber <= posts.count else {
                print("Invalid Comment Number")
                return
            }
            guard posts[postNumber-1].userId == AuthService.shared.getCurrentUser()!.userId else{
                print("You can't delete the post , It's not yours")
                return
            }
            let deletePost = posts[postNumber-1]
            
            Confirmation.perform(label: "Post",
                                 performLabel: "Deleted",
                                 status: ActionStatus.getStatus,
                                 action: PostService.shared.deletePost(deletePost)
            )
            
            print("Post deleted successfully")
            return
        }
        catch{
            printInvalidInput()
        }
    }
   
}
