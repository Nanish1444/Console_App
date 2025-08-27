//
//  IDGenerator.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//
import Foundation

@propertyWrapper
struct IDGenerator {
    enum IDType {
        case user
        case post
        case comment
        var prefix : String {
            switch self {
            case .user:
                return "U"
            case .post:
                return "P"
            case .comment:
                return "C"
            }
        }
    }
    private static var counters : [IDType : UInt] = [.user:0 , .post:0 , .comment:0]
    var wrappedValue: String
    init(_ type:IDType) {
        IDGenerator.counters[type]! += 1
        let count = IDGenerator.counters[type]!
        self.wrappedValue = "\(type.prefix)\(count)"
    }
}

