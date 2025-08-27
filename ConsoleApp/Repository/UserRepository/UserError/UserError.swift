//
//  UserError.swift
//  App
//
//  Created by Nanish A on 27/08/25.
//



enum UserError: Error {
    case userNotFound
    case invalidUsername
    case invalidPassword
    case passwordTooShort
    case invalidInput
}
