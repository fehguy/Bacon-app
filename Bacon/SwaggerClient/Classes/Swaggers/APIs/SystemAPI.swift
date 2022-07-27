//
// SystemAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SystemAPI {
    /**
     Immediately executes or cancels completion of a running item
     
     - parameter itemId: (path)  
     - parameter execute: (query) if &#x60;true&#x60;, will execute the completion operation, if one is defined (optional, default to true)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func cancelRunningItem(itemId: String, execute: Bool? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        cancelRunningItemWithRequestBuilder(itemId: itemId, execute: execute).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Immediately executes or cancels completion of a running item
     - DELETE /schedule/running/{itemId}
     
     - parameter itemId: (path)  
     - parameter execute: (query) if &#x60;true&#x60;, will execute the completion operation, if one is defined (optional, default to true)

     - returns: RequestBuilder<Void> 
     */
    open class func cancelRunningItemWithRequestBuilder(itemId: String, execute: Bool? = nil) -> RequestBuilder<Void> {
        var path = "/schedule/running/{itemId}"
        let itemIdPreEscape = "\(itemId)"
        let itemIdPostEscape = itemIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{itemId}", with: itemIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "execute": execute
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Deletes a system state key
     
     - parameter stateKey: (query)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteSystemState(stateKey: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        deleteSystemStateWithRequestBuilder(stateKey: stateKey).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Deletes a system state key
     - DELETE /state
     
     - parameter stateKey: (query)  

     - returns: RequestBuilder<Void> 
     */
    open class func deleteSystemStateWithRequestBuilder(stateKey: String) -> RequestBuilder<Void> {
        let path = "/state"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "stateKey": stateKey
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter job: (body) the job description to execute (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func executeJob(job: Schedule? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        executeJobWithRequestBuilder(job: job).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - POST /job/execute
     - Executes an job
     
     - parameter job: (body) the job description to execute (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func executeJobWithRequestBuilder(job: Schedule? = nil) -> RequestBuilder<Void> {
        let path = "/job/execute"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: job)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     gets vacation mode state
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getAlertState(completion: @escaping ((_ data: JSONValue?,_ error: Error?) -> Void)) {
        getAlertStateWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     gets vacation mode state
     - GET /system/notifications
     - examples: [{contentType=application/json, example={
  "bytes": [
    123,
    125
  ],
  "empty": false
}}]

     - returns: RequestBuilder<JSONValue> 
     */
    open class func getAlertStateWithRequestBuilder() -> RequestBuilder<JSONValue> {
        let path = "/system/notifications"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<JSONValue>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     gets irrigation state
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getIrrigationState(completion: @escaping ((_ data: JSONValue?,_ error: Error?) -> Void)) {
        getIrrigationStateWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     gets irrigation state
     - GET /system/irrigation
     - examples: [{contentType=application/json, example={
  "bytes": [
    123,
    125
  ],
  "empty": false
}}]

     - returns: RequestBuilder<JSONValue> 
     */
    open class func getIrrigationStateWithRequestBuilder() -> RequestBuilder<JSONValue> {
        let path = "/system/irrigation"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<JSONValue>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Returns a specific running item
     
     - parameter itemId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getRunningItem(itemId: String, completion: @escaping ((_ data: RunningItem?,_ error: Error?) -> Void)) {
        getRunningItemWithRequestBuilder(itemId: itemId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Returns a specific running item
     - GET /schedule/running/{itemId}
     - examples: [{contentType=application/json, example={"empty": true}}]
     
     - parameter itemId: (path)  

     - returns: RequestBuilder<RunningItem> 
     */
    open class func getRunningItemWithRequestBuilder(itemId: String) -> RequestBuilder<RunningItem> {
        var path = "/schedule/running/{itemId}"
        let itemIdPreEscape = "\(itemId)"
        let itemIdPostEscape = itemIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{itemId}", with: itemIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<RunningItem>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getRunningItems(completion: @escaping ((_ data: RunningItem?,_ error: Error?) -> Void)) {
        getRunningItemsWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /schedule/running
     - Returns scheduled items currently being executed
     - examples: [{contentType=application/json, example={"empty": true}}]

     - returns: RequestBuilder<RunningItem> 
     */
    open class func getRunningItemsWithRequestBuilder() -> RequestBuilder<RunningItem> {
        let path = "/schedule/running"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<RunningItem>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSchedule(completion: @escaping ((_ data: Schedule?,_ error: Error?) -> Void)) {
        getScheduleWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /schedule
     - Returns schedule information across the entire system
     - examples: [{contentType=application/json, example={"empty": false}}]

     - returns: RequestBuilder<Schedule> 
     */
    open class func getScheduleWithRequestBuilder() -> RequestBuilder<Schedule> {
        let path = "/schedule"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Schedule>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Gets the system state
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSystemState(completion: @escaping ((_ data: [String:String]?,_ error: Error?) -> Void)) {
        getSystemStateWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Gets the system state
     - GET /state
     - Returns the entire system state
     - examples: [{contentType=application/json, example={"empty": false}}]

     - returns: RequestBuilder<[String:String]> 
     */
    open class func getSystemStateWithRequestBuilder() -> RequestBuilder<[String:String]> {
        let path = "/state"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[String:String]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     gets vacation mode state
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getVacationState(completion: @escaping ((_ data: JSONValue?,_ error: Error?) -> Void)) {
        getVacationStateWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     gets vacation mode state
     - GET /system/vacation
     - examples: [{contentType=application/json, example={
  "bytes": [
    123,
    125
  ],
  "empty": false
}}]

     - returns: RequestBuilder<JSONValue> 
     */
    open class func getVacationStateWithRequestBuilder() -> RequestBuilder<JSONValue> {
        let path = "/system/vacation"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<JSONValue>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter scheduleId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func rerunSchedule(scheduleId: String, completion: @escaping ((_ data: Schedule?,_ error: Error?) -> Void)) {
        rerunScheduleWithRequestBuilder(scheduleId: scheduleId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /schedule/rerun/{scheduleId}
     - Returns schedule information across the entire system
     - examples: [{contentType=application/json, example={"empty": false}}]
     
     - parameter scheduleId: (path)  

     - returns: RequestBuilder<Schedule> 
     */
    open class func rerunScheduleWithRequestBuilder(scheduleId: String) -> RequestBuilder<Schedule> {
        var path = "/schedule/rerun/{scheduleId}"
        let scheduleIdPreEscape = "\(scheduleId)"
        let scheduleIdPostEscape = scheduleIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{scheduleId}", with: scheduleIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Schedule>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter state
     */
    public enum State_setAlertState: String { 
        case notify = "notify"
        case disabled = "disabled"
    }

    /**
     Sets the system state
     
     - parameter state: (query)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setAlertState(state: State_setAlertState, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        setAlertStateWithRequestBuilder(state: state).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Sets the system state
     - POST /system/notifications
     - Sets the system to the specified alert state
     
     - parameter state: (query)  

     - returns: RequestBuilder<Void> 
     */
    open class func setAlertStateWithRequestBuilder(state: State_setAlertState) -> RequestBuilder<Void> {
        let path = "/system/notifications"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "state": state.rawValue
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter state
     */
    public enum State_setIrrigationState: String { 
        case enabled = "enabled"
        case disabled = "disabled"
    }

    /**
     Sets the irrigation state
     
     - parameter state: (query)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setIrrigationState(state: State_setIrrigationState, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        setIrrigationStateWithRequestBuilder(state: state).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Sets the irrigation state
     - POST /system/irrigation
     - Sets irrigation to the specified state
     
     - parameter state: (query)  

     - returns: RequestBuilder<Void> 
     */
    open class func setIrrigationStateWithRequestBuilder(state: State_setIrrigationState) -> RequestBuilder<Void> {
        let path = "/system/irrigation"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "state": state.rawValue
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Sets the vacation state
     
     - parameter state: (query)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setVacationState(state: Bool, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        setVacationStateWithRequestBuilder(state: state).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Sets the vacation state
     - POST /system/vacation
     - Sets the system to be on vacation mode
     
     - parameter state: (query)  

     - returns: RequestBuilder<Void> 
     */
    open class func setVacationStateWithRequestBuilder(state: Bool) -> RequestBuilder<Void> {
        let path = "/system/vacation"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "state": state
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter itemId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func triggerItem(itemId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        triggerItemWithRequestBuilder(itemId: itemId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - PUT /schedule/running/{itemId}
     - Forces an item to run
     
     - parameter itemId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func triggerItemWithRequestBuilder(itemId: String) -> RequestBuilder<Void> {
        var path = "/schedule/running/{itemId}"
        let itemIdPreEscape = "\(itemId)"
        let itemIdPostEscape = itemIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{itemId}", with: itemIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
