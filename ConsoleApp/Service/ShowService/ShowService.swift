//
//  ShowService.swift
//  ConsoleApp
//
//  Created by Nanish A on 20/08/25.
//


struct ShowService<T> {
    private let items: [T]
    private var index: Int = 0
    private let pageSize: Int
    
    init(allItems: [T], pageSize: Int ) {
        self.items = allItems
        self.pageSize = pageSize
    }
    
    func current() -> [T] {
        guard !items.isEmpty else {
            return []
        }
        let end = min(index + pageSize, items.count)
        return Array(items[index..<end])
    }
    
    mutating func next() -> Availability {
        guard index + pageSize < items.count else {
            return .noNext
        }
        index += pageSize
        return .available
    }
    
    mutating func previous() -> Availability {
        guard index - pageSize >= 0 else {
            return .noPrevious
        }
        index -= pageSize
        return .available
    }
    
    func getPrevNextAvailability() -> (Bool, Bool) {
        
        let canPrevious = index > 0
        let canNext = index+pageSize < items.count
        return (canPrevious, canNext)
    }
}
