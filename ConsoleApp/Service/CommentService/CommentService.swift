//
//  Untitled.swift
//  App
//
//  Created by Nanish A on 22/08/25.
//

struct CommentService {
    static var shared = CommentService()
    
    private init(){}
    
    private let commentRepository = CommentCRUD.shared
    
    
    func addComment(_ comment : String, _ postId:String) {
        let currentUserId = AuthService.shared.getCurrentUser()!.userId
        let comment = Comment(postId: postId, userId: currentUserId, content: comment)
        commentRepository.addComment(comment)
    }
    
    func deleteComment(_ comment: Comment) {
        commentRepository.deleteComment(comment)
    }
    
    func getAllComments(_ postId:String) -> Result<[Comment],CommentError> {
         return commentRepository.readAllComments(postId)
    }
    
}
