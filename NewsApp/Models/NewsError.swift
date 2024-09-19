//
//  NewsError.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//

import Foundation

enum NewsError: Error {
  case parsing(description: String)
  case network(description: String)
}
