//
//  PasswordValidate.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

struct Password {
    
    static func validate(_ password : String) -> Result<String,PasswordError> {
        var upperCase : Bool = false
        var lowerCase : Bool = false
        var specialChar : Bool = false
        var number : Bool = false
        
        guard password.count >= 8 else{
            return .failure(.invalidLength)
        }
        
        for char in password {
            if char.isUppercase {
                upperCase = true
            }
            else if char.isLowercase {
                lowerCase = true
            }
            else if !char.isLetter && !char.isNumber {
                specialChar = true
            }
            else if char.isNumber {
                number = true
            }
        }
        
        if !upperCase {
            return .failure(.missingUpperCase)
        } else if !lowerCase {
            return .failure(.missingLowerCase)
        } else if !specialChar {
            return .failure(.missingSpecialChar)
        } else if !number {
            return .failure(.missingNumber)
        }

        return .success("Valid Password")

    }
    static func hasher(_ input : String) -> String {
        var hash = 0
        for char in input {
            let tansformedChar = Int(char.asciiValue!)
            hash = (hash &* 31) &+ tansformedChar
        }
        return String(format: "%08x", hash)
    }
}

