//
// LightingZone.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct LightingZone: Codable {

    public enum DeviceType: String, Codable { 
        case dimmer = "dimmer"
        case _switch = "switch"
        case remote = "remote"
        case rangeExtender = "range-extender"
    }
    public var _id: String?
    public var name: String?
    public var deviceId: Int?
    public var deviceType: DeviceType?
    public var zone: String?
    public var rooms: [String]?

    public init(_id: String?, name: String?, deviceId: Int?, deviceType: DeviceType?, zone: String?, rooms: [String]?) {
        self._id = _id
        self.name = name
        self.deviceId = deviceId
        self.deviceType = deviceType
        self.zone = zone
        self.rooms = rooms
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case deviceId
        case deviceType
        case zone
        case rooms
    }


}
