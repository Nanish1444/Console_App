//
//  AuthenticationService.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//



enum AuthenticationError : Error {
    case userNotFound
    case incorrectPassword
}


class AuthenticationService {
    
    static var shared = AuthenticationService()
    
    private var userRepository = UserCRUD.sharedInstance
    
    private var currentUser: User?
    
    private init(){}
    
  func login(_ userId : Int , _ password : String) -> Result<LoginStatus,AuthenticationError> {
        
        guard let userRepo = userRepository.getUser(userId) else {
            return .failure(.userNotFound)
        }
        
        let hashPassword = PasswordHasher.stringToHash(password)
        
        guard !password.isEmpty , userRepo.password == hashPassword else {
            return .failure(.incorrectPassword)
        }
        currentUser = userRepo
        
    return .success(.loggedIn)
        
    }
    
 func register(_ userName : String ,_ password : String ,_ bio : String ) -> Int{
    
        let hashPassword = PasswordHasher.stringToHash(password)
        
        let user = userRepository.create(User(userName: userName, password: hashPassword , bio: bio, posts: []))
     
        currentUser = user
        return user.userId
}

    
    func getCurrentUser() -> User? {
        return currentUser
    }
    
    
}
