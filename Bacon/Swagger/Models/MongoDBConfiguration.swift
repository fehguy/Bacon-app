//
// MongoDBConfiguration.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct MongoDBConfiguration: Codable {

    public var host: String?
    public var db: String?
    public var collection: String?
    public var username: String?
    public var password: String?

    public init(host: String?, db: String?, collection: String?, username: String?, password: String?) {
        self.host = host
        self.db = db
        self.collection = collection
        self.username = username
        self.password = password
    }


}

