//
//  PostService.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//




struct PostService {
    
    static var shared = PostService()
    
    private let postRepository = PostCRUD.sharedInstance
    
    private let authService = AuthenticationService.shared

    
    private init(){}
    
    func createPost(_ content : String) throws {
        
        guard let userId = authService.getCurrentUser()?.userId else {
            throw UserError.userNotFound
        }
        
        let newPost = Post(userId: userId , content: content, createdAt: currentDate())
        postRepository.create(newPost)
        
    }
    
    
    func getAllPosts() -> [Post] {
        return postRepository.getAllPosts()
    }
   
    

    
}

