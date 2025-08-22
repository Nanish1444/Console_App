//
//  MenuOption.swift
//  ConsoleApp
//
//  Created by Nanish A on 21/08/25.
//

enum MenuOption : Int {
    case login = 1
    case register
    case exit
    
     static func fromUserInput(_ input : String? ) -> MenuOption? {
        
        guard let input = input else {
            return nil
        }
         let rawValue = Int(input) ?? -1
         
         if rawValue < 0 || rawValue > 3 {
             return nil
         }
        
        return MenuOption(rawValue: rawValue)
    }
}
