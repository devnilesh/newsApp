//
//  BookmarksViewModel.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//

import Foundation
final class BookmarksViewModel: ObservableObject {
  @Published var newsDataSource: [NewsRowViewModel] = []
  
  private let articleStore: ArticleStore = ArticleStore()
  
  init() {
    fetchAllBookmarks()
  }
  
  func fetchAllBookmarks() {
    let articles = articleStore.getAllBookmarks()
    newsDataSource = articles.map({ article in
      NewsRowViewModel(article: article, articleStore: articleStore)
    })
    print(newsDataSource.count)
  }
}
