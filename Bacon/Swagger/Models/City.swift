//
// City.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class City: JSONEncodable {

    public var id: Int64?
    public var name: String?
    public var lat: Double?
    public var lon: Double?
    public var country: String?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["id"] = self.id?.encodeToJSON()
        nillableDictionary["name"] = self.name
        nillableDictionary["lat"] = self.lat
        nillableDictionary["lon"] = self.lon
        nillableDictionary["country"] = self.country

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
