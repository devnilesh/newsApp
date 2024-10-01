//
//  NewsFetcherTests.swift
//  NewsAppTests
//
//  Created by Nilesh Mahajan on 30/09/24.
//

import XCTest
import Combine
@testable import NewsApp

final class NewsFetcherTests: XCTestCase {
  var sut: NewsFetcher!
  var mockService: MockAPIService!
  private var disposables = Set<AnyCancellable>()
  var newsDataSource: [NewsRowViewModel] = []
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mockService = MockAPIService(mockFile: "mockNews")
    sut = NewsFetcher(service: mockService)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    sut = nil
  }
  
  func testSearchAPI() {
    mockService = MockAPIService(mockFile: "mockNews")
    sut = NewsFetcher(service: mockService)
    let expectations = expectation(description: "SearchAPI")
    let _ = sut.search("").map { response in
      return response.articles.map { article in
          return NewsRowViewModel(article: article)
        
      }
    }
    .map(Array.removeDuplicates)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure( let error):
            self.newsDataSource = []
            XCTFail("failed with error = \(error)")
          case .finished:
            break
          }
        },
        receiveValue: { [weak self] article in
          guard let self = self else { return }
          debugPrint(article)
           self.newsDataSource = article
          expectations.fulfill()
      })
      .store(in: &disposables)
    waitForExpectations(timeout: 2.0)
  }
  
  func testTopArticles() {
    mockService = MockAPIService(mockFile: "mockNews")
    sut = NewsFetcher(service: mockService)
    let expectations = expectation(description: "TopArticles")
    let _ = sut.topArticles().map { response in
      return response.articles.map { article in
          return NewsRowViewModel(article: article)
        
      }
    }
    .map(Array.removeDuplicates)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure( let error):
            self.newsDataSource = []
            XCTFail("failed with error = \(error)")
          case .finished:
            break
          }
        },
        receiveValue: { [weak self] article in
          guard let self = self else { return }
          debugPrint(article)
           self.newsDataSource = article
          expectations.fulfill()
      })
      .store(in: &disposables)
    waitForExpectations(timeout: 2.0)
  }
  
}
