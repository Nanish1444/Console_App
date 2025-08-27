//
//  HomePage.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//



struct HomePage {
    
    static func home(){
        
        repeat{
            
            printHomePageContent()
            do {
                let userInput = try Input.userInput("option")
                let option = HomePageOption.getStatus(userInput)
                switch option {
                case .createPost:
                    CreatePost.create()
                case .viewPost:
                    ViewPost.view()
                case .viewDetails:
                    Bio.view()
                case .logout:
                    return
                case .none:
                    printInvalidInput()
                    continue
                }
            }
            catch {
                printInvalidInput()
            }
            
        }while(true)
    }
}





func printHomePageContent() {
    print("""
    ==================================================
    🏠 Welcome to Home Page!
    1️⃣  ➤ Create Post 
    2️⃣  ➤ View Post
    3️⃣  ➤ View Account Info
    4️⃣  ➤ Logout (Go to Main Page)
    """)
}


