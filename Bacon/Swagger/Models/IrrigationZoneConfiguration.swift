//
// IrrigationZoneConfiguration.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct IrrigationZoneConfiguration: Codable {

    public var _id: String?
    public var name: String?
    public var outputPosition: Int?
    public var outputRelayId: Int?

    public init(_id: String?, name: String?, outputPosition: Int?, outputRelayId: Int?) {
        self._id = _id
        self.name = name
        self.outputPosition = outputPosition
        self.outputRelayId = outputRelayId
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case outputPosition
        case outputRelayId
    }


}

