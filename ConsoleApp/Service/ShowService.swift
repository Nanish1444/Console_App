//
//  ShowService.swift
//  ConsoleApp
//
//  Created by Nanish A on 20/08/25.
//

struct ShowService<T> {
    
    private var viewedItem : [T] = []
    
    private var pendingItem : [T] = []
    
    private var currentItem : [T] = []
    
    init(pendingItem: [T]) {
        self.pendingItem = pendingItem
        
        execute()
    }
    
private mutating func execute(){
        
        var size = 5;
        while(!pendingItem.isEmpty && size>0) {
            size -= 1
            currentItem.append(pendingItem.removeLast())
        }
        
    }
    
    
mutating func next() -> Availablity {
        if pendingItem.isEmpty {
            return .noNext
        }
        let itemToShow = currentItem.removeFirst()
        viewedItem.append(itemToShow)
        currentItem.append(pendingItem.removeLast())
        
        return .available
    }
    
    
mutating func previous() -> Availablity {
        if viewedItem.isEmpty {
            return .noPrevious
        }
        currentItem.insert(viewedItem.removeLast(), at: 0)
        pendingItem.append(currentItem.removeLast())
        
        return .available
    }
    
    
func current() -> [T]? {
        if currentItem.isEmpty{
            return nil
        }
        
        return currentItem
    }
}
