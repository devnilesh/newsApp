//
//  ArticleStoreTests.swift
//  NewsAppTests
//
//  Created by Nilesh Mahajan on 30/09/24.
//

import XCTest
@testable import NewsApp

final class ArticleStoreTests: XCTestCase {
  var sut: ArticleStore!
  var datastorage: CoreDataStorage!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    datastorage = CoreDataStorage(inMemory: true)
    sut = ArticleStore(context: datastorage.context)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
    datastorage = nil
  }
  
  // Test all operations of article store
  func testArticleStore() {
    do {
      // Save mocked article to store
      let article = Article.mockArticle()
      sut.bookmarkArticle(article)
      
      // Fetch and test mocked article from store
      let fetchArticle = try sut.getNewsEntity(article)
      XCTAssertNotNil(fetchArticle)
      
      // fetch and assert all article methods
      let articles = try sut.getAllBookmarks()
      XCTAssertNotNil(articles)
      XCTAssertFalse(articles.isEmpty)
      
      // Delete articles and assert
      sut.deleteBookmark(article)
      let art = try sut.getNewsEntity(article)
      XCTAssert(art == nil)
    } catch {
      XCTFail(error.localizedDescription)
    }
  }  
}
