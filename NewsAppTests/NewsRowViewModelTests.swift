//
//  NewsRowViewModelTests.swift
//  NewsAppTests
//
//  Created by Nilesh Mahajan on 30/09/24.
//

import XCTest
@testable import NewsApp

final class NewsRowViewModelTests: XCTestCase {
  var sut: NewsRowViewModel!
  var articlestore: ArticleStore!
  var datastorage: CoreDataStorage!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    let article = Article.mockArticle()
    datastorage = CoreDataStorage(inMemory: true)
    articlestore = ArticleStore(context: datastorage.context)
    sut = NewsRowViewModel(article: article, articleStore: articlestore)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    datastorage = nil
    articlestore = nil
    sut = nil
  }
  
  func testNewsRowViewModelData() {
    XCTAssertFalse(sut.title.isEmpty)
    XCTAssertFalse(sut.id.isEmpty)
    XCTAssertFalse(sut.dayPublished.isEmpty)
    XCTAssertNotNil(sut.url)
    XCTAssertNotNil(sut.imageURL)
    XCTAssertFalse(sut.description.isEmpty)
    XCTAssertFalse(sut.source.isEmpty)
    XCTAssertNotNil(sut.author)
    XCTAssertNotNil(sut.content)
  }
  
  func testNewsRowBookmark() {
    XCTAssertFalse(sut.bookmark)
    XCTAssert(sut.bookmarkIcon == "bookmark")
    sut.toggleBookmark()
    XCTAssertTrue(sut.bookmark)
    XCTAssert(sut.bookmarkIcon == "bookmark.fill")
    sut.toggleBookmark()
    XCTAssertFalse(sut.bookmark)
    XCTAssert(sut.bookmarkIcon == "bookmark")
  }
}
