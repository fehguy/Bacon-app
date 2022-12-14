//
// SensorStatus.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct SensorStatus: Codable {

    public enum ModelType: String, Codable { 
        case window = "WINDOW"
        case door = "DOOR"
        case other = "OTHER"
    }
    public enum State: String, Codable { 
        case _open = "open"
        case closed = "closed"
    }
    public var _id: String
    public var name: String
    public var zones: [String]
    public var type: ModelType
    public var _description: String?
    public var rooms: [String]?
    public var state: State?

    public init(_id: String, name: String, zones: [String], type: ModelType, _description: String?, rooms: [String]?, state: State?) {
        self._id = _id
        self.name = name
        self.zones = zones
        self.type = type
        self._description = _description
        self.rooms = rooms
        self.state = state
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case zones
        case type
        case _description = "description"
        case rooms
        case state
    }


}

