//
//  Login.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//



struct Login {
    private static let authService = AuthService.shared
    
    static func login() {
        
        repeat{
            print("==================================================")
            print("Login Page ")
            do{
                
                let userName = try Input.userInput("userName")
                
                if !authService.userExists(userName) {
                    if askToRegisterOrRetry() {
                        Register.register()
                        return
                    }
                    continue
                }
                
                enterPassword(userName)
                HomePage.home()
                return
            }
            catch {
                printInvalidInput()
            }
        }while(true)
        
    }
    
    static func enterPassword(_ uniqueName : String) {

        repeat {
            do {
                let password  = try Input.userInput("password")
                
                let hashPassword = Password.hasher(password)
                
                let result = authService.login(uniqueName, hashPassword)
                
                switch result {
                case .success(_):
                    print("Login Successfully \n")
                    return
                case .failure(let error):
                    print(error)
                    continue
                }
            }
            catch {
                printInvalidInput()
                continue
            }
        }while(true)
        
    }
    
    private static func askToRegisterOrRetry() -> Bool {
        

           repeat {
               
               print("Account not found, do you want to register? (Y/N) ")

               do {
                   let choice = try Input.userInput("choice")
                       .trimmingCharacters(in: .whitespaces)
                       .uppercased()

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
}
