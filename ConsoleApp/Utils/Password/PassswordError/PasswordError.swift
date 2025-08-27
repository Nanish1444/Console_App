//
//  PasswordError.swift
//  App
//
//  Created by Nanish A on 26/08/25.
//

enum PasswordError : Error {
    case invalidLength
    case missingUpperCase
    case missingLowerCase
    case missingSpecialChar
    case missingNumber
}
