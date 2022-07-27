//
// TemperatureSummary.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class TemperatureSummary: JSONEncodable {

    public var zones: [TemperatureZone]?
    public var zoneStatus: [TemperatueZoneStatus]?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["zones"] = self.zones?.encodeToJSON()
        nillableDictionary["zoneStatus"] = self.zoneStatus?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

