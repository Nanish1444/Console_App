//
//  PostService.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//
struct PostService {
    
    static let shared = PostService()
    
    private let postRepository = PostCRUD.sharedInstance
    
    private let authService = AuthService.shared

    
    private init(){}
    
    func createPost(_ content : String) {
        let userId = authService.getCurrentUser()!.userId
        let newPost = Post(userId: userId , content: content, createdAt: DateTime.currentDate())
        postRepository.create(newPost)
    }
    
    func deletePost(_ post:Post) {
        postRepository.deletePost(post)
    }
    
    func likePost(_ postId:String) -> LikeState {
        let userId = authService.getCurrentUser()!.userId
        return postRepository.addLike(postId, userId)
    }
    func disLikePost(_ postId:String) -> LikeState {
        let userId = authService.getCurrentUser()!.userId
        return postRepository.removeLike(postId, userId)
    }
    func totalLikeCount(_ postId:String) -> Int {
        postRepository.getTotalLike(postId)
    }
    func getAllPosts() -> [Post] {
        return postRepository.getAllPosts()
    }
}

