//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import XCTest
@testable import NewsApp

final class NewsRequestTests: XCTestCase {
  var sut: NewsRequest!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    sut = NewsRequest(searchText: "")
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
  }
  
  func testNewsRequests() {
    guard let queryItems = sut.urlComponent.queryItems else {
      XCTFail("Query Items should not be nil")
      return
    }
    XCTAssert(queryItems.isEmpty == false)
    XCTAssertFalse(sut.path.isEmpty, "NewsRequest path should not be empty")
    XCTAssert(sut.requestMethod == .GET)
  }
}
