//
//  Check.swift
//  App
//
//  Created by Nanish A on 26/08/25.
//

struct Check {
    static func checkAvailability<T>(_ valueType : [T]?) -> Bool {
        guard let valueType = valueType  else {
            return false
        }
        return !valueType.isEmpty
    }

}
