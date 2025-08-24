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
       
        let newPost = Post(userId: userId , content: content, createdAt: DataTime.currentDate(),likes: [],comments: [])
        postRepository.create(newPost)
        
    }
    
    func addLike(_ post:Post) -> LikeState {
        let currentUserId = authService.getCurrentUser()?.userId ?? 0
        
        let like = Like(postId: post.postId,userId: currentUserId)
        
        return postRepository.addLike(post.postId,like)
    }
    func removeLike(_ post: Post) -> LikeState {
        let currentUserId = authService.getCurrentUser()?.userId ?? 0
        return postRepository.removeLike(post.postId, currentUserId)
    }
    
    func totalLikes(_ postId: Int) -> Int {
        return postRepository.getPost(postId)?.likes.count ?? 0
    }
    
    func getAllPosts() -> [Post] {
        return postRepository.getAllPosts()
    }
   
    

    
}

