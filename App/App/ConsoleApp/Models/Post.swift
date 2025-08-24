//
//  Post.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

struct Post {
@IDGenerator var postId : Int
    var userId : Int
    var content : String
    var createdAt : String
    var likes : Set<Like>
    var comments : [Comment]
    
    
    mutating func addLike(_ like : Like) -> LikeState {
        if self.likes.contains(like) {
            return .alreadyLiked
        }
        self.likes.insert(like)
        return .likeAdded
    }
    
   
    
    mutating func removeLike(_ userId : Int) -> LikeState {
        
        for like in likes {
            if like.userId == userId {
                likes.remove(like)
                return .likeRemove
            }
        }
        return .notLiked
    }
    
    
    mutating func addComment (_ comment : Comment)  {
        self.comments.append(comment)
    }
    
    
    mutating func removeComment(_ comment : Comment) {
        self.comments.removeAll{$0.commentId == comment.commentId}
    }
    
    mutating func updateContent(_ content:String){
        self.content = content
    }
    
    
   
}
