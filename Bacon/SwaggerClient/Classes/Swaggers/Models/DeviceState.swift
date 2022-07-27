//
// DeviceState.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct DeviceState: Codable {

    public var _id: String?
    public var name: String?
    public var lastUpdate: Date?
    public var level: Int?

    public init(_id: String?, name: String?, lastUpdate: Date?, level: Int?) {
        self._id = _id
        self.name = name
        self.lastUpdate = lastUpdate
        self.level = level
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case lastUpdate
        case level
    }


}

