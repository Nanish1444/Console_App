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
            
            do {
                let userInput = try Input.userInput("choice")
                let menuOption = MenuOption.getStatus(userInput)
                switch menuOption {
                case .login :
                    Login.login()
                case .register :
                    Register.register()
                case .exit:
                    print("Thanks For Visiting ")
                    return
                case .none:
                    printInvalidInput()
                    continue
                }
            }
            catch{
                printInvalidInput()
            }
        }while(true)
    }
}
 
