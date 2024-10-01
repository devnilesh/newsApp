//
//  BookmarksViewModel.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//

import Foundation
final class BookmarksViewModel: ObservableObject {
  @Published var newsDataSource: [NewsRowViewModel] = []
  
  private let articleStore: ArticleStore
  
  init(_ articleStore: ArticleStore = ArticleStore()) {
    self.articleStore = articleStore
    fetchAllBookmarks()
  }
  
  func fetchAllBookmarks() {
    do {
      let articles = try articleStore.getAllBookmarks()
      newsDataSource = articles.map({ article in
        NewsRowViewModel(article: article, articleStore: articleStore)
      })
    } catch {
      print("Failed to fetch bookmarks: \(error)")
    }
  }
}
