import Foundation
import Himotoki
import APIKit

struct ItemDatilRequest: MarketRequestType {
    typealias Response = Item

    var id: Int = 0

    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/items/\(id).json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
    
}