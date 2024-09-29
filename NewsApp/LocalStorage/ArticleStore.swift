//
//  ArticleStore.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//

import Foundation
import CoreData

final class ArticleStore: DataStorage {
  private var context = CoreDataStorage.shared.container.viewContext
  private var adaptor: NewsAdaptor
  private var articles: [Article] = []
  
  init() {
    adaptor = NewsAdaptor(context: context)
  }
  
  func bookmarkArticle(_ article: Article) {
    _ = adaptor.getNewsEntityFrom(article)
    saveContext()
  }
  
  func getAllBookmarks() -> [Article] {
    do {
      let request: NSFetchRequest<NewsEntity> = NewsEntity.fetchRequest()
      let newsEntities = try context.fetch(request)
      articles = adaptor.getArticlsFromNewsEntities(entities: newsEntities)
      return articles
    } catch {
      print("Failed to fetch bookmarks: \(error)")
    }
    return []
  }
  
  func deleteBookmark(_ article: Article) {
    do {
      guard let newsEntity = try getNewsEntity(article) else {
        return
      }
      context.delete(newsEntity)
      saveContext()
      if let itemIndx = articles.firstIndex(where: {$0.title == article.title}) {
        articles.remove(at: itemIndx)
      }
    } catch {
      print("Failed to delete bookmark: \(error)")
    }
  }
  
  func getNewsEntity(_ article: Article) throws -> NewsEntity?  {
    let request: NSFetchRequest<NewsEntity> = NewsEntity.fetchRequest()
    request.fetchLimit = 1
    request.predicate = NSPredicate(
      format: "title LIKE %@", "\(article.title)"
    )
    return try context.fetch(request).first
  }
  
  func isBookmarked(_ article: Article) -> Bool {
    do {
      let article = try getNewsEntity(article)
      return (article != nil) ? true : false
    } catch {
      print("Failed to save context: \(error)")
      return false
    }
  }
  
  private func saveContext() {
    if context.hasChanges {
      do {
        try context.save()
        articles = getAllBookmarks()
      } catch {
        print("Failed to save context: \(error)")
      }
    }
  }
}

