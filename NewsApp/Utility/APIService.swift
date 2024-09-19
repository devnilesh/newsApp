//
//  NetworksService.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import Combine

final class APIService {  
  public var request: APIRequest?
  private let session: URLSession
  
  typealias Response = News
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  public func execute<T>() -> AnyPublisher<T, NewsError> where T: Decodable{
    guard let url = request?.urlComponent.url else {
      let error = NewsError.network(description: "URL Component is nil, please check url component")
      return Fail(error: error).eraseToAnyPublisher()
    }
    
    return session.dataTaskPublisher(for: URLRequest(url: url))
      .mapError { error in
          .network(description: error.localizedDescription)
      }
      .flatMap(maxPublishers: .max(1)) { pair in
        decode(pair.data)
      }
      .eraseToAnyPublisher()
    
  }
}
