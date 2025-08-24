//
//  CommentRepository.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//

enum CommentError: Error {
    case cannotDelete
    case emptyContent
    case commentNotExist
    case commentBoxIsEmpty
}


class CommentCRUD {
    
    static var shared = CommentCRUD()
    
    private init() {
    }
    
    
    private var storage: [Int:[Comment]] = [:]
    
   
    
    func addComment(_ comment: Comment) {
        
        storage[comment.postId , default: []].append(comment)
        
    }
    
    
    func editComment(_ userComment: inout Comment , _ content : String) throws  {
    
        userComment.update(content)
        
    }
    
    
    func delete(_ userComment: Comment)  {
        
        storage[userComment.postId]?.removeAll {
            $0.commentId == userComment.commentId
        }
        
    }
    
    
    
    
    func readAll(_ postId : Int) -> Result<[Comment],CommentError>{
        
        guard storage[postId] != nil , !storage[postId]!.isEmpty else {
            return .failure(CommentError.commentBoxIsEmpty)
        }
        
        return .success(storage[postId]!) 
    }
    
    
    
    
}
