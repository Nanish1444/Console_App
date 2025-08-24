//
//  User.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

struct User {
    @IDGenerator var userId : Int
    var userName : String
    var password : String
    var bio : String
    var posts : [Post]
    
    
    mutating func addPost(_ post : Post) {
        self.posts.append(post)
    }
    mutating func removePost(_ post: Post) {
        self.posts.removeAll{ $0.postId == post.postId}
    }
    
    mutating func editBio(_ newBio : String) {
        self.bio = newBio
    }
   
}
