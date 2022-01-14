//
//  File.swift
//  
//
//  Created by Semen Kologrivov on 14.01.2022.
//

import Foundation

/// Protocol describing data class, can not be stored in DB
public protocol Entity: Any {

    associatedtype DBEntityType where DBEntityType: DBEntity

    var id: String { get }
    var dbEntity: DBEntityType { get }

    init(fromDBEntity dbEntity: DBEntityType)
}

/// Protocol describing data class for storing in DB
public protocol DBEntity: Any {

    associatedtype EntityType where EntityType: Entity

    var id: String { get }
    var entity: EntityType { get }

    init(fromEntity entity: EntityType)
}
