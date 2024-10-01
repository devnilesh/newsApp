//
//  NewsDashboardViewModel.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import SwiftUI
import Combine
final class NewsDashboardViewModel: ObservableObject {
  
  @Published var searchText: String = ""
  @Published var newsDataSource: [NewsRowViewModel] = []
  @Published var topHeadlinesSource: [NewsRowViewModel] = []
  private var defaultCountry = "India"
  private let newsFetchable: NewsFetchable
  private var disposables = Set<AnyCancellable>()
  private var articleStore: ArticleStore = ArticleStore()
  
  init(newsFetchable: NewsFetchable = NewsFetcher(),
       scheduler: DispatchQueue = DispatchQueue(label: "NewsDashboardViewModel")) {
    self.newsFetchable = newsFetchable
    fetchTopArticles()
    $searchText
      .dropFirst(1)
      .debounce(for: .seconds(0.5), scheduler: scheduler)
      .sink(receiveValue: fetchNews(searchText:))
      .store(in: &disposables)
    // By Default displaying news for India.
    fetchNews(searchText: defaultCountry)
  }
  
  // Search news with text query
  func fetchNews(searchText: String) {
    newsFetchable.search(searchText.isEmpty ? defaultCountry : searchText).map {[weak self] response in
      return response.articles.map { article in
        guard let articleStore = self?.articleStore else {
          return NewsRowViewModel(article: article)
        }
        return NewsRowViewModel(article: article, articleStore: articleStore)
      }
    }
    .map(Array.removeDuplicates)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure( let error):
            debugPrint(error)
            self.newsDataSource = []
          case .finished:
            break
          }
        },
        receiveValue: { [weak self] article in
          guard let self = self else { return }
          debugPrint(article)
           self.newsDataSource = article
      })
      .store(in: &disposables)
  }
  
  // Fetch all top articles
  func fetchTopArticles() {
    newsFetchable.topArticles().map { [weak self] response in
      return response.articles.map { article in
        guard let articleStore = self?.articleStore else {
          return NewsRowViewModel(article: article)
        }
        return NewsRowViewModel(article: article, articleStore: articleStore)
      }
    }
    .map(Array.removeDuplicates)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure( let error):
            debugPrint(error)
            self.topHeadlinesSource = []
          case .finished:
            break
          }
        },
        receiveValue: { [weak self] article in
          guard let self = self else { return }
          debugPrint(article)
           self.topHeadlinesSource = article
      })
      .store(in: &disposables)
  }
}
