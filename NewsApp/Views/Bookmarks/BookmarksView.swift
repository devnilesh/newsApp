//
//  BookmarksView.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//

import SwiftUI

struct BookmarksView: View {
  @ObservedObject var viewModel: BookmarksViewModel = BookmarksViewModel()
  
  var body: some View {
    List {
      if viewModel.newsDataSource.isEmpty {
        emptySection
      } else {
        newsSection
      }
    }.onAppear {
      viewModel.fetchAllBookmarks()
    }.navigationTitle("Bookmarks")
  }
  
}

#Preview {
  BookmarksView()
}

private extension BookmarksView {
  var newsSection: some View {
    Section {
      ForEach(viewModel.newsDataSource, id: \.self) { newsRowViewModel in
        NavigationLink(destination: ArticleDetailsView(viewModel: newsRowViewModel)) {
          NewsRowView.init(viewModel:newsRowViewModel)
        }
      }
      Spacer()
    }
  }
  
  var emptySection: some View {
    Text("No bookmarks")
      .foregroundColor(.gray)
  }
}
