//
//  User.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

struct User {
    @IDGenerator(.user) var userId : String
    var userName : String
    var displayName : String
    var password : String
    var bio : String
}
