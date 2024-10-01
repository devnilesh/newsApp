//
//  Article.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation
import SwiftData

struct Article: Decodable {
  var source: Source
  var author: String?
  var title: String
  var description: String?
  var url: String
  var urlToImage: String?
  var publishedAt: String
  var content: String?
}

extension Article {
  static func mockArticle() -> Article {
    var article = Article(source: Source(id: "reuters", name: "Reuters"),
            author: "Laila Bassam, Maya Gebeily",
            title: "Israel planted explosives in 5,000 Hezbollah pagers, say sources - Reuters",
            description: "The operation was an unprecedented Hezbollah security breach that saw thousands of pagers detonate across Lebanon, killing nine people and wounding nearly 3,000 others.",
            url: "https://www.reuters.com/world/middle-east/israel-planted-explosives-hezbollahs-taiwan-made-pagers-say-sources-2024-09-18/",
            urlToImage: "https://www.reuters.com/resizer/v2/CAPZ4224DFM7NBVVOSS7L2CNZU.jpg?auth=5591db7c391f9e27227a56fba37abe2b24337b78e49a9f2d4d3704e250879d12&height=1005&width=1920&quality=80&smart=true",
            publishedAt: "2024-09-18T06:40:00Z")
    article.content = "Test Content Data - The operation was an unprecedented Hezbollah security breach that saw thousands of pagers detonate across Lebanon, killing nine people and wounding nearly 3,000 others."
    return article
  }
}
