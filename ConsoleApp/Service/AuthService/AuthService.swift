//
//  AuthenticationService.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

class AuthService {
    
    static var shared = AuthService()
    private var userRepository = UserCRUD.sharedInstance
    private var currentUser: User?
    
    private init(){}
    
    func login(_ userName : String , _ enteredPassword : String) -> Result<Bool,AuthError> {
        let  user = userRepository.getUser(.userName(userName))
        guard user.password  == enteredPassword else {
            return .failure(.incorrectPassword)
        }
        currentUser = user
        return .success(true)
    }
    
    func register(_ userName :String,_ displayName : String ,_ password : String ,_ bio : String ){
        let hashPassword = Password.hasher(password)
        let user = userRepository.create(User(userName: userName,displayName: displayName,password: hashPassword,bio: bio))
        currentUser = user
    }
    
    func getCurrentUser() -> User? {
        return currentUser
    }
    
    func userExists(_ userName : String) -> Bool {
        userRepository.userExists(userName)
    }
    
    func updateBio(_ user: User ,_ newBio: String){
        userRepository.updateBio(user.userId, newBio)
        currentUser?.bio = newBio
    }
    
    func getUser(_ identifier : UserIdentifier) -> User {
        userRepository.getUser(identifier)
    }
}

