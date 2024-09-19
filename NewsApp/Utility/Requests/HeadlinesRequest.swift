//
//  headlinesRequest.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation

struct HeadlinesRequest: APIRequest {
  var searchText: String?
  var country: String?
  var category: String?
  
  var queryItems: [URLQueryItem]? {
    [
      URLQueryItem(name: "q", value: searchText),
      URLQueryItem(name: "country", value: country ?? "us"),
      URLQueryItem(name: "category", value: category),
      URLQueryItem(name: "apiKey", value: APIConstants.newsAPIKey)
    ]
  }
  
  var path: String {
    "/v2/top-headlines"
  }
}
