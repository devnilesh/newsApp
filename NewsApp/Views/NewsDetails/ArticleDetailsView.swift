//
//  NewsDetailsView.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import SwiftUI

struct ArticleDetailsView: View {
  var viewModel: NewsRowViewModel
  
  init(viewModel: NewsRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    ScrollView {
      VStack {
        AsyncImage(url: viewModel.imageURL) { image in
          image.resizable()
        } placeholder: {
          Image("placeholder")
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
        .frame(height: 200)
        VStack(spacing: 10.0) {
          TextView(viewModel.title)
            .font(.headline)
          if let author = viewModel.author {
            TextView(author)
          }
          TextView(viewModel.source)
          TextView(viewModel.dayPublished)
          TextView(viewModel.description)
          if let content = viewModel.content {
            TextView(content)
          }
          if let url = viewModel.url {
            Link("Show more", destination: url)
          }
        }
        Spacer()
    }
    }
  }
}

#Preview {
  ArticleDetailsView(viewModel: NewsRowViewModel(article: Article.mockArticle()))
}

struct TextView: View {
  let txt: String
  init(_ txt: String) {
    self.txt = txt
  }
  var body: some View {
    HStack{
      Text(txt)
        .padding(.leading, 10)
      Spacer()
    }
  }
}
