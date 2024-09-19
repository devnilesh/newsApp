//
//  News.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

struct News: Decodable {
  var status: String
  var totalResults: Int?
  var articles: [Article]
  
  enum CodingKeys: CodingKey {
    case status
    case totalResults
    case articles
  }
  
  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.status = try container.decode(String.self, forKey: .status)
    self.totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    self.articles = try container.decode([Article].self, forKey: .articles)
  }
}
