//
//  NewsDatasource.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import CoreData

final class NewsRowViewModel: ObservableObject, Identifiable {
  private let articleStore: ArticleStore
  private let article: Article
  
  @Published var bookmark: Bool = false {
    didSet {
      bookmarkIcon = !bookmark ? "bookmark" : "bookmark.fill"
    }
  }
  
  @Published var bookmarkIcon: String = ""
  
  init(article: Article, articleStore: ArticleStore = ArticleStore()) {
    self.article = article
    self.articleStore = articleStore
    self.bookmark = articleStore.isBookmarked(article)
  }
  
  var id: String {
    return title
  }
  
  var title: String {
    article.title
  }
  
  var dayPublished: String {
    "Published On: \(article.publishedAt.dateFormatter(style: .medium) ?? "" )"
  }
  
  var imageURL: URL? {
    URL(string: article.urlToImage ?? "")
  }
  
  var url: URL? {
    URL(string: article.url)
  }
  
  var description: String {
    article.description ?? ""
  }
  
  var author: String? {
    if let author = article.author {
        return "Author: \(author)"
    }
    return nil
  }
  
  var source: String {
    "Source: \(article.source.name)"
  }
  
  var content: String? {
    article.content
  }
  
  func toggleBookmark() {
    bookmark = !bookmark
    if bookmark {
      articleStore.bookmarkArticle(article)
    } else {
      articleStore.deleteBookmark(article)
    }
  }
}
 
extension NewsRowViewModel: Hashable {
  static func == (lhs: NewsRowViewModel, rhs: NewsRowViewModel) -> Bool {
    return lhs.title == rhs.title
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.title)
  }
}
