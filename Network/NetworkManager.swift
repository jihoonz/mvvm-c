import Foundation
import Alamofire

class NetworkManager {
    typealias CompletionHandler = (Data?, HTTPURLResponse?, Error?) -> Void
    
    private var timeInterval: TimeInterval = 30
    
    private let config: NetworkConfiguration
    
    init(config: NetworkConfiguration, timeInterval: Double = 30) {
        self.config = config
        self.timeInterval = timeInterval
    }
    
    func request(completion: @escaping CompletionHandler) {
        var request = URLRequest(url: config.url)
        let jsonData = try? JSONSerialization.data(withJSONObject: config.parameters, options: [])
        
        request.headers = HTTPHeaders(config.headers)
        request.httpBody = jsonData
        request.httpMethod = config.method.rawValue
        request.timeoutInterval = timeInterval
        
        AF.request(request).responseJSON { response in
            completion(response.data, response.response, response.error)
        }
    }
}
