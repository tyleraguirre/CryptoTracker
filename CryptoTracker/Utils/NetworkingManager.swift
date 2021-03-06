//
//  NetworkingManager.swift
//  CryptoTracker
//
//  Created by Tyler Aguirre on 3/7/22.
//

import Foundation
import Combine
class NetworkingManager {
    
    enum NetowrkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[💩] Bad response from URL: \(url)"
            case .unknown: return "[🤷🏻‍♂️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
       return URLSession.shared.dataTaskPublisher(for: url) // this already runs on a background thread
//             .subscribe(on: DispatchQueue.global(qos: .default)) runs this on a background thread
             .tryMap({ try handleURLResponse(output: $0, url: url) })
             .retry(3)
             .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw NetowrkingError.badURLResponse(url: url)
              }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
