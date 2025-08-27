
//
//  ViewOption.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//
enum ViewPostOption : Int {
    case previous = 1
    case next
    case like
    case dislike
    case viewComment
    case addComment
    case deletePost
    case back
    
    static func getStatus(_ userInput : String? ) -> ViewPostOption? {
        
        guard let userInput = userInput,
              let selectedNumber = Int(userInput),
              let status = ViewPostOption(rawValue: selectedNumber) else {
            return nil
        }
        
        return status
    }
}

