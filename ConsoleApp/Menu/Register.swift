//
//  Register.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//
import Foundation
enum RegisterIssues : Error {
    
    case userNameTooShort(String)
}


struct Register {
    
    static func register() {
        print(" We Provide a UserId. Everytime You Login Using That UserId and Your Password")
        repeat {
            
            print("Enter a UserName : ",terminator: "")
            
            let userName = readLine() ?? ""
            
            switch validate(userName) {
            case .failure(.userNameTooShort(let name)):
                print("Too Short User Name is not Allowed : " ,name)
                continue
            default:
                break;
            }
            
            passwordRule()
            
            repeat {
                
                print("Enter a Password : ",terminator: "")
                let password = readLine() ?? ""
                
                switch PasswordValidate.validatePassword(password) {
                    case .success:
                        let bio = write()
                        let userId = AuthenticationService.shared.register(userName,password,bio)
                        print("This is your UserId : ",userId,"  Note it... It will be used for Login ")
                        sleep(5)
                        print( "Registration Successful")
                        HomePage.home()
                        return
                    case .failure(let message):
                    print("Password is Invalid : ",message)
                }
                
            }while(true)
                    
        }while(true)
    }
    
    static func validate(_ userName: String) -> Result<String,RegisterIssues> {
        guard (userName.count >= 3) else {
            return .failure(.userNameTooShort(userName))
        }
        return .success("")
    }
}

func passwordRule() {
    print("""
    Enter your password. Your password must contain:

    - At least 8 characters
    - At least 1 uppercase letter
    - At least 1 lowercase letter
    - At least 1 number
    - At least 1 special character (e.g., !@#$%^&*)
    """)
}


func write() -> String {
    print(" Write you bio here:  It Will Show On Your Profile....")
    let bio = readLine() ?? ""
    
    return bio
}
