//
// TemperatueZoneStatus.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** status of a single zone */
open class TemperatueZoneStatus: JSONEncodable {

    public enum Heater: String { 
        case on = "on"
        case off = "off"
    }
    public enum Units: String { 
        case celcius = "celcius"
        case fahrenheit = "fahrenheit"
    }
    /** the unique identifier for the zone */
    public var id: String?
    /** the name of the zone */
    public var name: String?
    /** the temperature in the zone */
    public var value: Double?
    /** the state of the heater */
    public var heater: Heater?
    /** the temperature units */
    public var units: Units?
    /** the timestamp when the temperature was measured */
    public var timestamp: Date?
    public var rooms: [String]?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["id"] = self.id
        nillableDictionary["name"] = self.name
        nillableDictionary["value"] = self.value
        nillableDictionary["heater"] = self.heater?.rawValue
        nillableDictionary["units"] = self.units?.rawValue
        nillableDictionary["timestamp"] = self.timestamp?.encodeToJSON()
        nillableDictionary["rooms"] = self.rooms?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

