//
//  Posterror.swift
//  App
//
//  Created by Nanish A on 26/08/25.
//

enum PostError: Error {
    case postNotFound
    case cannotDeletePost
    case cannotLikeOwnPost
    case alreadyLiked
    case postContentEmpty
}
