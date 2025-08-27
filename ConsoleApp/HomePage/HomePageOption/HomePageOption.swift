//
//  HomePageOption.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

enum HomePageOption : Int {
    case createPost = 1
    case viewPost
    case viewDetails
    case logout
    
    static func getStatus(_ userInput : String?) -> HomePageOption? {
        
        guard let userInput = userInput,
              let selectedNumber = Int(userInput),
              let status = HomePageOption(rawValue: selectedNumber) else {
            return nil
        }
        
        return status
    }
}
