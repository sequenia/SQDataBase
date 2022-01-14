//
//  File.swift
//  
//
//  Created by Semen Kologrivov on 14.01.2022.
//

import Foundation

// MARK: - Repository
public protocol Repository {

    associatedtype DBEntityType where DBEntityType: DBEntity

    func list() -> [DBEntityType.EntityType]
    func list(_ isIncluded: @escaping (DBEntityType) -> Bool) -> [DBEntityType.EntityType]

    func find(byId id: String) -> DBEntityType.EntityType?
    func find(_ isIncluded: @escaping (DBEntityType) -> Bool) -> DBEntityType.EntityType?

    func insertOrUpdate(object: DBEntityType.EntityType)

    func deleteAll()
    func delete(byId id: String)
    func delete(_ isIncluded: @escaping (DBEntityType) -> Bool)
}
