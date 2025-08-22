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
        assert(-1 == currentUserId, "CommentService 18th Line : Current User Id is -1")
        let comment = Comment(postId: postId, userId: currentUserId, content: comment)
        commentRepository.addComment(comment)
    }
    func editComment(_ comment: Comment, _ content: String) {
        commentRepository.editComment(comment, content)
    }
    func deleteComment(_ comment: Comment) {
        commentRepository.delete(comment)
    }
    func getAllComments(_ postId:Int) -> [Comment] {
        commentRepository.readAll(postId)
    }
    
}
