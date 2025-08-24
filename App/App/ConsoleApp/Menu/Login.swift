//
//  Login.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//




struct Login {
    
    
    private static var authenticationService = AuthenticationService.shared
    
    static func login() {
        
        loginInstruct()
        
        repeat {
            print("If You Want to Exit Type EXIT and Press Enter")
            print("Enter UserId : ",terminator: "")
            let input = Validation.fromInput(readLine())
            let userId:Int
            switch input {
            case .correct(let id):
                userId = id
            case .incorrect:
                continue
            case .exit:
                return
            case .none:
                return
            }
            
            print("Enter Password : ",terminator: "")
            let password: String = readLine() ?? ""
            
            let result = authenticationService.login(userId, password)
            
            
            switch result {
                case .success(.loggedIn):
                        HomePage.home()
                        print("Logout Successfully")
                        return
                case .failure(.userNotFound):
                    print("User Not Found")
                case .failure(.incorrectPassword):
                    print("Incorrect Password")
                
            }
            
        }while(true)
        
        
    }
}


func loginInstruct() {
    print(" Login Section - 📱")
    print("Enter UserId And Password to login..")
}
