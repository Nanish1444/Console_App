import Foundation

class UserCRUD {
    
    static let sharedInstance : UserCRUD =  UserCRUD()
    private var storage : [String : User] = [:]
    
    private init() {}
    
    func create(_ user : User )  -> User {
        storage[user.userId] = user
        return user
    }
    
    func getUser(_ identifier : UserIdentifier ) -> User {
        
        switch identifier {
        case .id(let userId):
            storage[userId]!
        case .userName(let userName):
            storage.values.first(where: {$0.userName == userName})!
        }
        
    }
    
    func updateBio(_ userId : String , _ newBio: String){
        storage[userId]?.bio = newBio
    }
    
    func delete(_ userId : String) {
        storage[userId] = nil
    }
    
    func userExists(_ userName : String ) -> Bool {
        storage.values.contains(where: {$0.userName == userName})
    }
    
}
