//
//  CreatePost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

struct CreatePost {
    
    static func create()  {
        repeat {
            printCreatePostContent()
            do {
                let postContent = try Input.userInput("post content ")
                
                Confirmation.perform(label: "Post",
                                     performLabel: "created",
                                     status: ActionStatus.getStatus,
                                     action: PostService.shared.createPost(postContent)
                )
                
                return
            }
            catch{
                printInvalidInput()
                continue
            }
        }while(true)
    }
}



func printCreatePostContent() {
    print("""
    =============================
    📝  Create a New Post
    =============================
    
    """)
}

func printConfirmContent() {
    print("""
        1️⃣  Confirm 📌
        2️⃣  Cancel ❌
        
        """)
}
