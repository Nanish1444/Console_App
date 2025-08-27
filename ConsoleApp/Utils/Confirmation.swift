//
//  Conf.swift
//  App
//
//  Created by Nanish A on 27/08/25.
//

struct Confirmation {
    
    static func perform(label:String,performLabel : String , status: (String)->ActionStatus?,action : @autoclosure () -> Void) {
        
        repeat {
            printConfirmContent()
            do {
                let optionResult = try Input.userInput("option ")
                let option = status(optionResult)
                switch option {
                case .confirm:
                    action()
                    print("\(label) \(performLabel) Successfully... \n")
                    return
                case .cancel:
                    print("Process Cancel... \n")
                    return
                case .none:
                    printInvalidInput()
                }
            }
            catch{
                printInvalidInput()
            }
            
        }while(true)
    }
   
}
