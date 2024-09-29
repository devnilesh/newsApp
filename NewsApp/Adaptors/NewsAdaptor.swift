//
//  NewsAdaptor.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//

import Foundation
import CoreData

final class NewsAdaptor {
  private var context : NSManagedObjectContext
  
  init(context: NSManagedObjectContext) {
    self.context = context
  }
  
  func getNewsEntityFrom(_ article: Article) -> NewsEntity {
    let newsEntity: NewsEntity = NewsEntity(context: context)
    newsEntity.id = UUID()
    newsEntity.title = article.title
    newsEntity.author = article.author
    newsEntity.content = article.content
    newsEntity.publishedAt = article.publishedAt
    newsEntity.details = article.description
    newsEntity.url = article.url
    newsEntity.urlToImage = article.urlToImage
    newsEntity.source = article.source.name
    newsEntity.sourceId = article.source.id ?? ""
    return newsEntity
  }
  
  func getArticlsFromNewsEntities(entities: [NewsEntity]) -> [Article] {
    let articles: [Article] = entities.compactMap { newsEntity in
      let source: Source = Source(id: newsEntity.source, name: newsEntity.sourceId)
      var article = Article(source: source,
                            title: newsEntity.title,
                            url: newsEntity.url,
                            publishedAt: newsEntity.publishedAt)
      article.title = newsEntity.title
      article.author = newsEntity.author
      article.content = newsEntity.content
      article.publishedAt = newsEntity.publishedAt
      article.description = newsEntity.details
      article.url = newsEntity.url
      article.urlToImage = newsEntity.urlToImage
      return article
    }
    return articles
  }
}
