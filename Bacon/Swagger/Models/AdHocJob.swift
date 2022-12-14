//
// AdHocJob.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class AdHocJob: JSONEncodable {

    public var now: [Any]?
    public var until: Any?
    public var finally: [Any]?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["now"] = self.now?.encodeToJSON()
        nillableDictionary["until"] = self.until
        nillableDictionary["finally"] = self.finally?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

