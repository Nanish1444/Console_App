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
    case commentNotExist(String)
    case commentBoxIsEmpty(String)
}


class CommentCRUD {
    
    static var shared = CommentCRUD()
    
    private init() {}
    
    
    private var storage: [Int:[Comment]] = [:]
    
   
    
    func addComment(_ comment: Comment) {
        
        storage[comment.postId , default: []].append(comment)
        
    }
    
    
    func editComment(_ userComment: Comment , _ content : String) throws  {
        
        guard storage[userComment.postId] != nil else {
            throw CommentError.notFound
        }
        var getComment : Comment!
        
        for comment in storage[userComment.postId]! {
            if comment.commentId == userComment.commentId {
                getComment = comment
                break;
            }
        }
        
        guard getComment != nil else {
            throw CommentError.commentNotExist("Comment Does not exist in the Comment box")
        }
        
        getComment.content = content
        
    }
    
    
    func delete(_ userComment: Comment)  {
        
        storage[userComment.postId]?.removeAll {
            $0.commentId == userComment.commentId
        }
        
    }
    
    
    
    
    func readAll(_ postId : Int) -> Result<[Comment],CommentError>{
        
        guard storage[postId] != nil else {
            return .failure(CommentError.notFound)
        }
        
        guard !storage[postId]!.isEmpty else {
            return .failure(CommentError.commentBoxIsEmpty("Comment Box is Empty"))
        }
        
        return .success(storage[postId]!) 
    }
    
    
    
}
