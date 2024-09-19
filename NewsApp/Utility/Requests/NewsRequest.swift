//
//  NewsRequest.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation

struct NewsRequest: APIRequest {
  
  var searchText: String
  
  var queryItems: [URLQueryItem]? {
    [
      URLQueryItem(name: "q", value: searchText),
      URLQueryItem(name: "apiKey", value: APIConstants.newsAPIKey)
    ]
  }
  
  var path: String {
    "/v2/everything"
  }
}
