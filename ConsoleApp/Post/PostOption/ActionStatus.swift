//
//  ActionStatus.swift
//  App
//
//  Created by Nanish A on 27/08/25.
//

enum ActionStatus: Int {
    case confirm = 1
    case cancel

    static func getStatus(_ userInput: String?) -> ActionStatus? {
        guard let userInput = userInput,
              let selectedNumber = Int(userInput),
              let status = ActionStatus(rawValue: selectedNumber) else {
            return nil
        }
        return status
    }
}
