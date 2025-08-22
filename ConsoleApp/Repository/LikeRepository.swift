//
//  LIkeRepository.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//

class LikeCRUD {
    
    static var shared = LikeCRUD()
    
    private init() {}
    
    private var storage : [Like] = []
    
    
    
    func addLike(_ like: Like) {
        storage.append(like)
    }
    
    func delete(_ postId: Int ,_ userId: Int) {
        storage.removeAll(where: {$0.postId == postId && $0.userId == userId })
    }
    
    func alreadyLiked(_ postId: Int ,_ userId: Int) -> Bool {
        return storage.contains(where: {$0.postId == postId && $0.userId == userId })
    }
    
    func totalLikes(_ postId: Int) -> Int {
        return storage.filter({$0.postId == postId}).count
    }
    
}

