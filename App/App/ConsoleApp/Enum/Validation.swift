//
//  Validation.swift
//  App
//
//  Created by Nanish A on 24/08/25.
//

enum Validation {
    case correct(Int)
    case incorrect
    case exit
    
    static func fromInput(_ input : String?) -> Validation? {
        guard let intValue = input else {
            return .none
        }
        if intValue.lowercased() == "exit" {
            return .exit
        }
        let id = Int(intValue) ?? -1
        
        return id == -1 ? .incorrect : .correct(id)
    }
}
