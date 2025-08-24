import Foundation



enum UserError: Error {
    case userNotFound
    case invalidUsername
    case invalidPassword
    case usernameAlreadyTaken
    case passwordTooShort(min: Int)
    case userNotLoggedIn
    case unauthorizedAction
}

class UserCRUD {
    
    static var sharedInstance : UserCRUD =  UserCRUD()
    
    private init() {
    }
    
    private var storage : [Int : User] = [:]
    
    
    func create(_ user : User )  -> User {
        
        storage[user.userId] = user
        
        return user
        
    }
    
    func getUser(_ userId : Int ) -> User? {
        
       return storage[userId]
        
    }
    
    func updateBio(_ userId : Int , _ newBio: String){
        storage[userId]?.editBio(newBio)
    }
    
    func delete(_ userId : Int) {
        
        storage[userId] = nil
        
    }
    
}
