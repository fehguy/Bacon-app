//
// TemperatureZoneConfiguration.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct TemperatureZoneConfiguration: Codable {

    public var _id: String?
    public var name: String?
    public var outputPosition: Int?
    public var outputRelayId: Int?
    public var zone: String?
    public var inputPosition: Int?
    public var inputSensorId: Int?
    public var rooms: [String]?

    public init(_id: String?, name: String?, outputPosition: Int?, outputRelayId: Int?, zone: String?, inputPosition: Int?, inputSensorId: Int?, rooms: [String]?) {
        self._id = _id
        self.name = name
        self.outputPosition = outputPosition
        self.outputRelayId = outputRelayId
        self.zone = zone
        self.inputPosition = inputPosition
        self.inputSensorId = inputSensorId
        self.rooms = rooms
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case outputPosition
        case outputRelayId
        case zone
        case inputPosition
        case inputSensorId
        case rooms
    }


}

