//
//  Menu.swift
//  ConsoleApp
//
//  Created by Nanish A on 20/08/25.
//




struct Menu {
    
    static func start() {
        
        repeat {
            print("📜 Main Menu ")
            print("1.Login")
            print("2.Register")
            print("3.Exit")
            
            print("Enter the number here : ",terminator: "")
            
            let userInput = MenuOption.fromUserInput(readLine())
            
            switch userInput {
                
            case .login :
                
                Login.login()
                
            case .register :
                
                Register.register( )
                
            case .exit , .none:
                print("Thanks For Visiting ")
                return
                
                
            }
            
        }while(true)
        
        
        
    }
}
 
