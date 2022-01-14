//
//  File.swift
//  
//
//  Created by Semen Kologrivov on 14.01.2022.
//

import RealmSwift
import SQDBProtocols

/// Protocol describing data class for storing in Realm
public protocol RealmEntity where Self: DBEntity & Object {

}
