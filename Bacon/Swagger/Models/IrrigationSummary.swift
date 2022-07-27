//
// IrrigationSummary.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class IrrigationSummary: JSONEncodable {

    public var dailyRunTime: RunTime?
    public var zones: [IrrigationZone]?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["dailyRunTime"] = self.dailyRunTime?.encodeToJSON()
        nillableDictionary["zones"] = self.zones?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

