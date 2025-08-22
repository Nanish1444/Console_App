//
//  IDGenerator.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//
import Foundation

@propertyWrapper
struct IDGenerator {
    
    private static var current : Int = 0
    
    var wrappedValue: Int
    
    init(wrappedValue: Int) {
        IDGenerator.current += 1
        
        self.wrappedValue = IDGenerator.current
    }
}

func currentDate() -> String {
    return Date().description
}
