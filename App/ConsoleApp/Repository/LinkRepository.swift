//
//  LIkeRepository.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.
//


class Linker<OwnerID: Hashable, MemberID: Hashable> {
    
    private var storage: [OwnerID: Set<MemberID>] = [:]
    
    func addLink(ownerID: OwnerID, memberID: MemberID) {
        
        if storage[ownerID] == nil {
            storage[ownerID] = []
        }
        storage[ownerID]?.insert(memberID)
    }
    
    func removeLink(ownerID: OwnerID, memberID: MemberID) {
        storage[ownerID]?.remove(memberID)
    }
    
    
    func hasLink(ownerID: OwnerID, memberID: MemberID) -> Bool {
        return storage[ownerID]?.contains(memberID) ?? false
    }
    
    func totalLinks(ownerID: OwnerID) -> Int {
        return storage[ownerID]?.count ?? 0
    }
    
    func getMembers(ownerID: OwnerID) -> Set<MemberID>? {
        return storage[ownerID]
    }
}

//class LikeCRUD {
//
//    static var shared = LikeCRUD()
//
//    private init() {}
//
//    private var storage : [Like] = []
//
//
//
//    func addLike(_ like: Like) {
//        storage.append(like)
//    }
//
//    func delete(_ postId: Int ,_ userId: Int) {
//        storage.removeAll(where: {$0.postId == postId && $0.userId == userId })
//    }
//
//    func alreadyLiked(_ postId: Int ,_ userId: Int) -> Bool {
//        return storage.contains(where: {$0.postId == postId && $0.userId == userId })
//    }
//
//    func totalLikes(_ postId: Int) -> Int {
//        return storage.filter({$0.postId == postId}).count
//    }
//
//}
