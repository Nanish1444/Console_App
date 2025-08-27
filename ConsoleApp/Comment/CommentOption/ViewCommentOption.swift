//
//  ViewCommentOption.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

enum ViewCommentOption : Int {
    
    case previous = 1
    case next
    case delete
    case back
    
    static func getStatus(_ userInput : String?) -> ViewCommentOption? {
        guard let userInput = userInput,
              let selectedNumber = Int(userInput),
              let status = ViewCommentOption(rawValue: selectedNumber) else {
            return nil
        }
        return status
    }
}
