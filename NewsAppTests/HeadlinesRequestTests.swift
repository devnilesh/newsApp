//
//  HeadlinesRequestTests.swift
//  NewsAppTests
//
//  Created by Nilesh Mahajan on 30/09/24.
//

import XCTest
@testable import NewsApp

final class HeadlinesRequestTests: XCTestCase {
  var sut: HeadlinesRequest!

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    sut = HeadlinesRequest(searchText: "")
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
    XCTAssertFalse(sut.path.isEmpty, "HeadlinesRequest path should not be empty")
    XCTAssert(sut.requestMethod == .GET)
  }
}
