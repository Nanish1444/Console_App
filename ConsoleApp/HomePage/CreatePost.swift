//
//  CreatePost.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

struct CreatePost {
    
    static func create()  {
        createPostContent()
        
        let postContent = readLine() ?? ""
                   
        createPostContentAfterInput()
        
        let userInput = PostStatus.getStatus(from: readLine())
        
        switch userInput {
        case .save:
            do {
                try PostService.shared.createPost(postContent)
                print("Post Saved...")
            }
            catch{
                print("There was an error In post service 27th line...")
            }
        case .cancel:
            print("Post Cancelled...")
        default:
            print("Invalid Input... Move to HomePage...")
        }
        
    }
}






func createPostContent() {
    print("""
    =============================
    📝  Create a New Post
    =============================
    
    Enter your post content below ⬇️
    
    """)
}

func createPostContentAfterInput() {
    print("""
        Choose an option below ⬇️

        1️⃣  Save Post 📌
        2️⃣  Cancel Post ❌
        
        """)
}
