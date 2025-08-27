//
//  ViewBio.swift
//  App
//
//  Created by Nanish A on 26/08/25.
//

enum BioStatus : Int{
    case edit = 1
    case back
    static func getStatus(_ userInput : String?) -> BioStatus? {
        guard let userInput = userInput,
              let selectedNumber = Int(userInput),
              let status = BioStatus(rawValue: selectedNumber) else {
            return nil
        }
        return status
    }
}

struct Bio {
    private static let authService = AuthService.shared
    static func view() {
        
        repeat {
            let user = authService.getCurrentUser()!
            printUserDetails(user)
            printOptionForBio()
            do {
                let userInput = try Input.userInput("choice")
                let result = BioStatus.getStatus(userInput)
                switch result {
                case .edit :
                    let newBio = try Input.userInput("bio")
                    
                    Confirmation.perform(label: "Bio",
                                         performLabel: "edited",
                                         status: ActionStatus.getStatus,
                                         action: AuthService.shared.updateBio(user,newBio) )
                case .back:
                    print("Back to Home page \n")
                    return
                case .none:
                    continue
                }
            }
            catch{
                printInvalidInput()
            }
        }while(true)
    }
    

}
func printUserDetails(_ user: User) {
    print("""
        
        =====================================================
        User account information 
        
        
        UserName : \(user.userName)
        
        DisplayName : \(user.displayName)
        
        UserBio : \(user.bio)
        
        =====================================================
        """)
}
func printOptionForBio() {
    print("""
        1️⃣ ➤ Edit Bio
        2️⃣ ➤ Back
        """)
}
