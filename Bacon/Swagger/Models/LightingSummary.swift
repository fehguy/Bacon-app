//
// LightingSummary.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** ok */
open class LightingSummary: JSONEncodable {

    public var zones: [LightingZone]?
    public var zoneStatus: [LightingZoneStatus]?

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

