import Foundation
import Alamofire

struct NetworkConfiguration {
    
    let url: URL
    let headers: [String : String]
    let parameters: [String : String]
    let method: HTTPMethod
    
    internal init(url: URL, headers: [String : String], parameters: [String : String], method: HTTPMethod) {
        self.url = url
        self.headers = headers
        self.parameters = parameters
        self.method = method
    }
}
