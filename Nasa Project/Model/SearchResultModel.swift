//
//  SearchResultModel.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// model for search results , contains id, image url, title, description and date created
import Foundation

struct SearchResultModel  : Hashable, Identifiable {
    
    let id: String
    let imageURL: String
    let title: String
    let description: String
    let date: String
    
    init(id:String, imageURL: String, title: String, description: String, date: String) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.description = description
        self.date = date
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: SearchResultModel, rhs: SearchResultModel) -> Bool {
        return lhs.id == rhs.id
    }
}

extension SearchResultModel : Codable {
    enum CodingKeys: String, CodingKey{
        case id
        case imageURL
        case title
        case description
        case date
    }
}


