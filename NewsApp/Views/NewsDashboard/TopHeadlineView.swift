//
//  TopHeadlineView.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import SwiftUI

struct TopHeadlineView: View {
  private let viewModel: NewsRowViewModel
  
  init(viewModel: NewsRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      AsyncImage(url: viewModel.imageURL) { image in
        image.resizable()
      } placeholder: {
        Image("placeholder")
          .resizable()
      }
      VStack(spacing: 10.0) {
        Text(viewModel.title)
          .font(.headline)
        Text(viewModel.dayPublished)
          .font(.footnote)
          .fontWeight(.medium)
      }
    }
  }
}

#Preview {
  TopHeadlineView(viewModel: NewsRowViewModel(article: Article.mockArticle()))
}
