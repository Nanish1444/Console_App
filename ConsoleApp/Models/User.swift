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
    init(userName: String, password: String, bio: String) {
        self.userId = 0
        self.userName = userName
        self.password = password
        self.bio = bio
    }
}
