//
//  BookmarksViewModelTests.swift
//  NewsAppTests
//
//  Created by Nilesh Mahajan on 30/09/24.
//

import XCTest
@testable import NewsApp

final class BookmarksViewModelTests: XCTestCase {
  var sut: BookmarksViewModel!
  var articlestore: ArticleStore!
  var datastorage: CoreDataStorage!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    datastorage = CoreDataStorage(inMemory: true)
    articlestore = ArticleStore(context: datastorage.context)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
  }
  
  func testBookmarkViewModel() {
    let article = Article.mockArticle()
    articlestore.bookmarkArticle(article)
    sut = BookmarksViewModel(articlestore)
    
    sut.fetchAllBookmarks()
    XCTAssertFalse(sut.newsDataSource.isEmpty)
    XCTAssert(sut.newsDataSource.count == 1)
  }
  
}
