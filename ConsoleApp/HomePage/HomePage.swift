//
//  HomePage.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//



struct HomePage {
    
    static func home(){
        
        
        repeat{
            
            homePageContent()
            
            let userInput = HomePageOption.fromUserInput(readLine())
            
            switch userInput {
                
            case .createPost:
                
                CreatePost.create()
                
            case .viewPost:
                
                ViewPost.view()
                
            case .logout:
                
                return
                
            case .none:
                
                print("Invalid Input. Please try again.")
                
                continue
            }
            
        }while(true)
        
    }
}





func homePageContent() {
    print("""
    🏠 Welcome to Home Page!
    Please enter a choice below:

    1️⃣ ➤ Create Post
    2️⃣ ➤ View Post
    3️⃣ ➤ Logout (Go to Main Page)
    
    """)
}

