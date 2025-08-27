//
//  Input.swift
//  App
//
//  Created by Nanish A on 25/08/25.
//
extension String {
    var cleanedInput: String {
        return self.unicodeScalars.filter { $0.isASCII && $0.value >= 32 && $0.value != 127 }
            .map { String($0) }
            .joined()
            .trimmingCharacters(in: .whitespaces)
    }
}


struct Input {
    private static let min = 1
    private static let max = 10
    
    static func userInput(_ label : String) throws -> String {
        
        print("Enter your \(label) here : ",terminator: "")
        
        guard let userInput = readLine() else{
            throw UserError.invalidInput
        }
        return userInput.cleanedInput
    }
    
    static func getValidCount(_ label:String) -> Int {
        
        repeat{
            do {
                let userInput = try Input.userInput("number of \(label) you want to view (1–10)")
                guard let viewNumber = Int(userInput) , viewNumber >= min && viewNumber <= 10 else{
                    continue
                }
                return viewNumber
            }
            catch {
                printInvalidInput()
                continue
            }
            
        }while(true)
    }
}

