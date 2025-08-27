//
//  LIkeRepository.swift
//  ConsoleApp
//
//  Created by Nanish A on 22/08/25.

class Linker<OwnerID: Hashable, MemberID: Hashable> {
    
    private var storage: [OwnerID: Set<MemberID>] = [:]

    func addLink(ownerID: OwnerID, memberID: MemberID) {
        storage[ownerID, default: []].insert(memberID)
    }

    func removeOwnerID(ownerID: OwnerID) {
        storage[ownerID] = nil
    }

    func removeMemberID(ownerID: OwnerID, memberID: MemberID) {
        storage[ownerID]!.remove(memberID)
    }

    func hasLink(ownerID: OwnerID, memberID: MemberID) -> Bool {
        storage[ownerID]?.contains(memberID) ?? false
    }

    func totalLinks(ownerID: OwnerID) -> Int {
        storage[ownerID]?.count ?? 0
    }

}
