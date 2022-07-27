//
// EventsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class EventsAPI: APIBase {
    /**
     Adds a new event to the system
     - parameter event: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func addEvent(event: Event, completion: @escaping ((_ error: ErrorResponse?) -> Void)) {
        addEventWithRequestBuilder(event: event).execute { (response, error) -> Void in
            completion(error)
        }
    }


    /**
     Adds a new event to the system
     - POST /events

     - parameter event: (body)  
     - returns: RequestBuilder<Void> 
     */
    open class func addEventWithRequestBuilder(event: Event) -> RequestBuilder<Void> {
        let path = "/events"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = event.encodeToJSON()

        let url = NSURLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
