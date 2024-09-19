//
//  NewsRowView.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import SwiftUI

struct NewsRowView: View {
  private let viewModel: NewsRowViewModel
  
  init(viewModel: NewsRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    HStack {
      AsyncImage(url: viewModel.imageURL) { image in
        image.resizable()
      } placeholder: {
        Image("placeholder")
          .resizable()
      }
      .frame(width: 100, height: 100)
      VStack(alignment: .leading, spacing: 10.0) {
        Text(viewModel.title)
          .font(.headline)
        Text(viewModel.dayPublished)
          .font(.footnote)
          .fontWeight(.medium)
      }
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
   NewsRowView(viewModel: NewsRowViewModel(article: Article.mockArticle()))
}

