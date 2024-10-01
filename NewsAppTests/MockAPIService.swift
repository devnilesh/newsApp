//
//  MockAPIService.swift
//  NewsAppTests
//
//  Created by Nilesh Mahajan on 30/09/24.
//

import Foundation
import Combine
@testable import NewsApp

class MockAPIService: APIService {
  var session: URLSession
  
  var mockFile: String
  var request: APIRequest?
  
  init(mockFile: String, session: URLSession = .shared) {
    self.mockFile = mockFile
    self.session = session
  }
  
  func execute<T>() -> AnyPublisher<T, NewsError> where T : Decodable {
    guard let url = Bundle(for: MockAPIService.self).url(forResource: mockFile, withExtension: "json") else {
      let error = NewsError.network(description: "Failed to locate JSON file.")
      return Fail(error: error).eraseToAnyPublisher()
    }
    
     return session.dataTaskPublisher(for: url)
      .mapError { error in
          .network(description: error.localizedDescription)
      }
      .flatMap(maxPublishers: .max(1)) { pair in
        decode(pair.data)
      }
      .eraseToAnyPublisher()
  }
}
