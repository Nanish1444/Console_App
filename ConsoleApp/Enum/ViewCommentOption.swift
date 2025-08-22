//
//  ViewCommentOption.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

enum ViewCommentOption : Int {
    case previous = 1
    case next
    case addComment
    case back
    
    static func fromInput(_ input:String?) -> ViewCommentOption? {
        guard let input = Int(input ?? "") else {
            return nil
        }
        return ViewCommentOption(rawValue: input)
    }
}
