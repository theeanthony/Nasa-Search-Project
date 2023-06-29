//
//  SearchResponse.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// Search Response is the data that is fetched from the API Request, which is later converted to SearchResultModel for easier handling for me

import Foundation

struct SearchResponse: Codable {
    let collection: Collection
    
    struct Collection: Codable {
        let items: [Item]
        let metadata : MetaData

        struct Item: Codable {
            let data: [Data]
            let links: [Link]
            
            struct Data: Codable {
              
                let nasa_id: String?
                let title: String?
                let description: String?
                let date_created: String?
            }
            
            struct Link: Codable {
                let href: String
            }
       
        }
        struct MetaData : Codable {
            let total_hits : Int
        }
    }
}
