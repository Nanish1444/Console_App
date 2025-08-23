//
//  Untitled.swift
//  App
//
//  Created by Nanish A on 22/08/25.
//

struct CommentService {
    static var instance = CommentService()
    
    private init(){}
    
    private let commentRepository = CommentCRUD.shared
    
    
    func addComment(_ comment : String, _ postId:Int) {
        let currentUserId = AuthenticationService.shared.getCurrentUser()?.userId ?? -1
        
        precondition(-1 == currentUserId, "Something Wrong On the Serive of Comment Does not find a User...")
        
        let comment = Comment(postId: postId, userId: currentUserId, content: comment)
        
        commentRepository.addComment(comment)
    }
    func editComment(_ comment: Comment, _ content: String) throws {
        try commentRepository.editComment(comment, content)
    }
    func deleteComment(_ comment: Comment) {
        commentRepository.delete(comment)
    }
    func getAllComments(_ postId:Int) -> Result<[Comment],CommentError> {
         return commentRepository.readAll(postId)
    }
    
}
