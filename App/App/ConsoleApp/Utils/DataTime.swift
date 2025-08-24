//
//  DataTime.swift
//  App
//
//  Created by Nanish A on 24/08/25.
//
import Foundation

struct DataTime {
    static func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}
