//
//  Moya+Promises.swift
//  PhotoGallery
//
//  Created by Hasan Serdar on 15.12.2018.
//  Copyright © 2018 Homify. All rights reserved.
//

import Foundation
import Moya
import Promises
extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "tr_TR_POSIX")
        return formatter
    }()
}

extension Response {
    public func map<T: Decodable>(_ type: T.Type) throws -> T {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            
            return try decoder.decode(T.self, from: data)
        } catch let error {
            print(error)
            throw MoyaError.jsonMapping(self)
        }
    }
    
    public func map<T: Decodable>(_ type: T.Type) throws -> [T] {
        do {
            return try JSONDecoder().decode([T].self, from: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }
}

extension MoyaProvider {
    func promise<A: Decodable>(_ target: Target, handler: @escaping (Moya.Response) -> A) -> Promise<A> {
        let promise = Promise<A>.pending()
        
        request(target) { result in
            switch result {
            case let .success(response):
                promise.fulfill(handler(response))
                
            case let .failure(error):
                promise.reject(error)
            }
        }
        return promise
    }
    
    func promise<A: Decodable>(_ target: Target) -> Promise<A> {
        let promise = Promise<A>.pending()
        
        request(target) { result in
            switch result {
            case let .success(response):
                do {
                    //                    print(String(data: response.data, encoding: .utf8))
                    try promise.fulfill(response.map(A.self))
                } catch let error {
                    promise.reject(error)
                }
                
            case let .failure(error):
                promise.reject(error)
            }
        }
        return promise
    }
}
