//
//  NewsEntity+CoreDataProperties.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//
//

import Foundation
import CoreData


extension NewsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsEntity> {
        return NSFetchRequest<NewsEntity>(entityName: "NewsEntity")
    }

    @NSManaged public var title: String
    @NSManaged public var author: String?
    @NSManaged public var details: String?
    @NSManaged public var url: String
    @NSManaged public var urlToImage: String?
    @NSManaged public var publishedAt: String
    @NSManaged public var content: String?
    @NSManaged public var id: UUID
    @NSManaged public var source: String
    @NSManaged public var sourceId: String

}

extension NewsEntity : Identifiable {

}
