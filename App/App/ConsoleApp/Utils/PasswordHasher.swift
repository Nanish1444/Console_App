//
//  PasswordHasher.swift
//  SocialPost
//
//  Created by Nanish A on 20/08/25.
//

struct PasswordHasher {
    
    static func stringToHash(_ input : String) -> String {
        
        var hash = 0
        
        for char in input {
            
            let tansformedChar = Int( char.asciiValue ?? 0)
            
            hash = (hash &* 31) &+ tansformedChar
            
        }
        
        return String(format: "%08x", hash)
    }
}
