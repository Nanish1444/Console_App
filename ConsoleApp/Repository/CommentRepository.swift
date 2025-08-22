//
//  CommentRepository.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//

enum CommentError: Error {
    case notFound
    case cannotDelete
    case emptyContent
}


class CommentCRUD {
    
    static var shared = CommentCRUD()
    
    private init() {}
    
    
    private var storage: [Int:Comment] = [:]
    
   
    
    func addComment(_ comment: Comment) {
        storage[comment.commentId] = comment
    }
    func editComment(_ comment: Comment , _ content : String) {
        storage[comment.commentId]?.content = content
    }
    func delete(_ comment: Comment)  {
        storage[comment.commentId] = nil
    }
    
    
    
    
    func readAll(_ postId : Int) -> [Comment] {
        var comments : [Comment] = []
        
        for commet in storage.values {
            if commet.postId == postId {
                comments.append(commet)
            }
        }
        return comments
    }
    
    
    
}
