//
//  Client.swift
//  WeatherApp
//
//  Created by Ogün Birinci on 27.11.2022.
//

import Foundation

final class Client {
    
    enum Endpoints {
        static let base = "http://api.weatherstack.com/"
        static let access_key = "9b6890aedced007ed0fd3103e4ae08a6"

        case current(String)
        
        var stringValue: String {
            switch self {
            case .current(let cityName):
                let cityNameWithoutSpace = cityName.replacingOccurrences(of: " ", with: "+")
                return Endpoints.base + "/current?access_key=\(Client.Endpoints.access_key)&query=\(cityNameWithoutSpace)"
            }
            
        }

        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()

        return task
    }
    
    class func getCurrentWeather(cityName:String, completion: @escaping (Weather?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.current(cityName).url, responseType: Weather.self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
