//
//  NewsFetcher.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import Combine

protocol NewsFetchable {
  func search(_ queryText: String) -> AnyPublisher<News, NewsError>
  func topArticles() -> AnyPublisher<News, NewsError>
}
