//
// TemperatureZone.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class TemperatureZone: JSONEncodable {

    /** the unique identifier for the zone */
    public var id: Int32?
    public var name: String?
    public var inputPosition: Int32?
    public var outputPosition: Int32?
    public var zone: String?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["id"] = self.id?.encodeToJSON()
        nillableDictionary["name"] = self.name
        nillableDictionary["inputPosition"] = self.inputPosition?.encodeToJSON()
        nillableDictionary["outputPosition"] = self.outputPosition?.encodeToJSON()
        nillableDictionary["zone"] = self.zone

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

