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
    
     static func getStatus(_ userInput : String? ) -> MenuOption? {
        
        guard let userInput = userInput,
                let selectedNumber = Int(userInput),
                let menuOption = MenuOption(rawValue: selectedNumber) else {
            return nil
        }
        
        return menuOption
    }
}
