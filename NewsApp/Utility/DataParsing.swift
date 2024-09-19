//
//  DataParsing.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, NewsError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .print()
    .mapError { error in
      .parsing(description: error.localizedDescription.debugDescription)
    }
    .eraseToAnyPublisher()
  
}
