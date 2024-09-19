//
//  NewsRequest.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
enum RequestMethod {
  case GET
  case POST
  case DELETE
  case PUT
}

protocol APIRequest {
  var queryItems: [URLQueryItem]? {get}
  var path: String {get}
  var requestMethod: RequestMethod {get}
}

extension APIRequest {
  // By Default Request method is GETe
  var requestMethod: RequestMethod {
    .GET
  }
  
  var urlComponent: URLComponents {
    var urlComponent = URLComponents()
    urlComponent.host = APIConstants.host
    urlComponent.scheme = APIConstants.scheme
    urlComponent.path = path
    urlComponent.queryItems = queryItems
    return urlComponent
  }
}
