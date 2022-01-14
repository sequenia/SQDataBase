//
//  File.swift
//  
//
//  Created by Semen Kologrivov on 14.01.2022.
//

import SQDBProtocols
import RealmSwift

public protocol RealmRepository: Repository {

    var realm: Realm? { get set }

    init(realm: Realm?)
}

public extension RealmRepository where DBEntityType: RealmEntity {

    func list() -> [DBEntityType.EntityType] {
        self.list({ _ in true })
    }

    func list(_ isIncluded: @escaping (DBEntityType) -> Bool) -> [DBEntityType.EntityType] {
        self.realm?.objects(DBEntityType.self)
            .filter(isIncluded)
            .compactMap { $0.entity } ?? []
    }

    func find(byId id: String) -> DBEntityType.EntityType? {
        self.find({ $0.id == id })
    }

    func find(_ isIncluded: @escaping (DBEntityType) -> Bool) -> DBEntityType.EntityType? {
        guard let result = self.realm?.objects(DBEntityType.self)
                .filter(isIncluded).first else { return nil }

        return result.entity
    }

    func insertOrUpdate(object: DBEntityType.EntityType) {
        guard let realmEntity = object.dbEntity as? Object else { return }

        try? self.realm?.write {
            self.realm?.add(realmEntity, update: .all)
        }
    }

    func deleteAll() {
        self.delete({ _ in true })
    }

    func delete(byId id: String) {
        self.delete({ $0.id == id })
    }

    func delete(_ isIncluded: @escaping (DBEntityType) -> Bool) {
        guard let objects = self.realm?.objects(DBEntityType.self)
            .filter(isIncluded) else { return }

        try? self.realm?.write {
            self.realm?.delete(objects)
        }
    }

}
