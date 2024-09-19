//
//  NewsDatasource.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
struct NewsRowViewModel: Identifiable {
  
  private let article: Article
  
  init(article: Article) {
    self.article = article
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
}
 
extension NewsRowViewModel: Hashable {
  static func == (lhs: NewsRowViewModel, rhs: NewsRowViewModel) -> Bool {
    return lhs.title == rhs.title
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.title)
  }
}
