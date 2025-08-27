//
//  Register.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//
import Foundation

struct Register {
    
    private static let minUserNameLength = 3
    private static let authService = AuthService.shared
    
    static func register() {
        
        repeat {
            print("==================================================")
            print("Register Page ")
            do {
                let userName  = try Input.userInput("userName")
                
                if authService.userExists(userName) {
                    if askToLoginOrRetry() {
                        Login.login()
                        return
                    }
                    continue
                }
                enterPassword(userName)
                print("Register Successful \n")
                HomePage.home()
                return
            }
            catch {
                printInvalidInput()
            }
            
        }while(true)
    }
    
    static func enterPassword(_ userName : String) {
        printPasswordRule()
        repeat {
            do {
                let password  = try Input.userInput("password")
                
                let validationResult = Password.validate(password)
                switch validationResult {
                case .success(_):
                    let conformPassword  = try Input.userInput("conform password")
                    if password != conformPassword {
                        print("Password does not match")
                        continue
                    }
                    generalInformation(userName,password)
                    return
                case .failure(let error):
                    print(error)
                    continue
                }
            }
            catch {
                printInvalidInput()
            }
        }while(true)
    }
    
    private static func askToLoginOrRetry() -> Bool {

           repeat {
               
               print("Account found, do you want to login? (Y/N) ")

               do {
                   let choice = try Input.userInput("choice")

                   switch choice.uppercased() {
                   case "Y": return true
                   case "N": return false
                   default:
                       printInvalidInput()
                       continue
                   }

               } catch {
                   printInvalidInput()
                   continue
               }
               
           } while(true)
       }
    
    static func generalInformation(_ userName : String,_ password: String) {
        let bio = try! Input.userInput("bio")
        let displayName = try! Input.userInput("displayName")
        authService.register(userName, displayName, password, bio)
    }
    
}


func printPasswordRule() {
    print("""
    Enter your password. Your password must contain:

    - At least 8 characters
    - At least 1 uppercase letter
    - At least 1 lowercase letter
    - At least 1 number
    - At least 1 special character (e.g., !@#$%^&*)
    """)
}

