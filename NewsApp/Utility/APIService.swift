//
//  NetworksService.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import Combine

protocol APIService {
  var session: URLSession { get set}
  var request: APIRequest? { get set }
  func execute<T>() -> AnyPublisher<T, NewsError> where T: Decodable
}
