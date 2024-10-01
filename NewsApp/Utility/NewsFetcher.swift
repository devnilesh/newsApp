//
//  NewsFetcher.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import Combine

final class NewsFetcher: NewsFetchable {
  private var service: APIService
  
  init(service: APIService = NewsAPIService()) {
    self.service = service
  }
  
  func search(_ queryText: String) -> AnyPublisher<News, NewsError> {
    service.request = NewsRequest(searchText: queryText)
    return service.execute()
  }
  
  func topArticles() -> AnyPublisher<News, NewsError> {
    service.request = HeadlinesRequest()
    return service.execute()
  }
}
