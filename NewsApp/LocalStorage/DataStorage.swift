//
//  DataStorage.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//

import Foundation
protocol DataStorage {
  func bookmarkArticle(_ article: Article)
  func getAllBookmarks() throws -> [Article]
  func deleteBookmark(_ article: Article)
}
