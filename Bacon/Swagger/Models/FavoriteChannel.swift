//
// FavoriteChannel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class FavoriteChannel: JSONEncodable {

    public var title: String?
    public var albumArtURI: String?
    public var uri: String?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["title"] = self.title
        nillableDictionary["albumArtURI"] = self.albumArtURI
        nillableDictionary["uri"] = self.uri

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

