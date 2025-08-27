//
//  CommentRepository.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//
class CommentCRUD {
    static let shared = CommentCRUD()
    
    private init() {}

    private var storage: [String:[Comment]] = [:]
 
    func addComment(_ comment: Comment) {
        storage[comment.postId , default: []].append(comment)
    }
    
    func deleteComment(_ userComment: Comment) {
        storage[userComment.postId]?.removeAll {
            $0.commentId == userComment.commentId
        }
    }
    
    func deleteAllPostComment(_ postId : String) {
        storage[postId] = nil
    }
    
    func readAllComments(_ postId : String) -> Result<[Comment],CommentError>{
        guard let value = storage[postId] , !value.isEmpty else {
            return .failure(CommentError.commentBoxIsEmpty)
        }
        return .success(value)
    }

}
