//
//  NewsDashboard.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import SwiftUI

struct NewsDashboard: View {
  @ObservedObject var viewModel: NewsDashboardViewModel = NewsDashboardViewModel()
  
  var body: some View {
    NavigationView {
      List {
        if !viewModel.topHeadlinesSource.isEmpty {
          topHeadlines
        }
        searchField
        if viewModel.newsDataSource.isEmpty {
          emptySection
        } else {
          newsSection
        }
      }
      .listStyle(GroupedListStyle())
      .navigationBarTitle("News 🪩") 
      .navigationBarItems(trailing: NavigationLink(destination: BookmarksView()) {
        Text("Bookmarks")
    })
    }
  }
}

#Preview {
  return NewsDashboard()
}


private extension NewsDashboard {
  var searchField: some View {
    HStack(alignment: .center) {
      TextField("Search here for ex: bitcoin", text: $viewModel.searchText)
    }
  }
  
  var newsSection: some View {
    Section {
      ForEach(viewModel.newsDataSource, id: \.self) { newsRowViewModel in
        NavigationLink(destination: ArticleDetailsView(viewModel: newsRowViewModel)) {
          NewsRowView.init(viewModel:newsRowViewModel)
        }
      }
    }
  }
  
  var emptySection: some View {
    Section {
      Text("No results")
        .foregroundColor(.gray)
    }
  }
  
  var topHeadlines: some View {
    Section {
      Text("Top Headlines").font(.title).foregroundColor(.black)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 10) {
          ForEach(viewModel.topHeadlinesSource) { viewModel in
            NavigationLink(destination: ArticleDetailsView(viewModel: viewModel)) {
              TopHeadlineView.init(viewModel:viewModel)
                .frame(width: 200, height: 200)
            }
          }
        }
      }
    }
  }
}
