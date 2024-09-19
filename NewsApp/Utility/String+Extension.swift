//
//  String+Extension.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 19/09/24.
//
import Foundation
extension String {
  func dateFormatter(style: DateFormatter.Style) -> String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.timeZone = .current
    formatter.dateStyle = style
    formatter.locale = Locale(identifier: "en-US")
    return formatter.string(from: Date())
  }
}
