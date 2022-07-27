//
// Track.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class Track: JSONEncodable {

    public var title: String?
    public var uri: String?
    public var albumArtURI: String?
    public var artist: String?
    public var album: String?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["title"] = self.title
        nillableDictionary["uri"] = self.uri
        nillableDictionary["albumArtURI"] = self.albumArtURI
        nillableDictionary["artist"] = self.artist
        nillableDictionary["album"] = self.album

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
