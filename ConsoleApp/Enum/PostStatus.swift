//
//  PostStatus.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

enum PostStatus : Int{
    case save = 1
    case cancel
    static func getStatus(from input: String?) -> PostStatus? {
        guard let intValue = Int(input ?? "") else { return nil }
        return PostStatus(rawValue: intValue)
    }
}

