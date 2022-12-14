//
// TemperatueZoneStatus.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** status of a single zone */

public struct TemperatueZoneStatus: Codable {

    public enum Heater: String, Codable { 
        case on = "on"
        case off = "off"
    }
    public enum Units: String, Codable { 
        case celcius = "celcius"
        case fahrenheit = "fahrenheit"
    }
    /** the unique identifier for the zone */
    public var _id: String
    /** the name of the zone */
    public var name: String?
    /** the temperature in the zone */
    public var value: Double?
    /** the minimum temperature at which heating should begin */
    public var setPoint: Double?
    /** the state of the heater */
    public var heater: Heater?
    /** the temperature units */
    public var units: Units?
    /** the timestamp when the temperature was measured */
    public var timestamp: Date
    public var rooms: [String]?

    public init(_id: String, name: String?, value: Double?, setPoint: Double?, heater: Heater?, units: Units?, timestamp: Date, rooms: [String]?) {
        self._id = _id
        self.name = name
        self.value = value
        self.setPoint = setPoint
        self.heater = heater
        self.units = units
        self.timestamp = timestamp
        self.rooms = rooms
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case name
        case value
        case setPoint
        case heater
        case units
        case timestamp
        case rooms
    }


}

