
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
    case back
    static func fromInput(_ input: String?) -> ViewPostOption? {
        guard let intValue = Int(input ?? "") else { return nil }
        return ViewPostOption(rawValue: intValue)
    }
}

