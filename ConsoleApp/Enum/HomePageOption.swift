//
//  HomePageOption.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

enum HomePageOption : Int {
    case createPost = 1
    case viewPost
    case logout
    
    static func fromUserInput(_ input : String?) -> HomePageOption? {
        
        guard let raw = Int(input ?? "") else {
            return nil
        }
        return HomePageOption(rawValue: raw)
    }
}
