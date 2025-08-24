//
//  Availablity.swift
//  App
//
//  Created by Nanish A on 24/08/25.
//

struct PostAvailablity {
    static func checkPostAvailability(_ post : [Post]?) -> Bool {
        guard let post = post else {
            return false
        }
        return !post.isEmpty
    }
}

