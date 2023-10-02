//
//  Product.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import Foundation

struct Student {
  let firstName: String
}


struct Product: Identifiable, Codable {
    
    let id: UUID = UUID()
    
    let name: String
    let description: String
    let price: Int
    let images: [ProductImage]
  
  enum CodingKeys: String, CodingKey {
    case name
    case description = "Description"
    case price
    case images = "product_images"
  }
  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self.name = try container.decode(String.self, forKey: .name)
//    self.description = try container.decode(String.self, forKey: .description)
//    self.price = try container.decode(Int.self, forKey: .price)
//  }
    
}


extension Product {
  
  /// JSONlint to validate JSON format
  static var sampleJSON: String {
    /// three quotes to support multi line strings
    """
    {
      "name" : "Bukse",
      "description" : "Kjedelig og kort",
      "price": 699,
      "product_images":[{
        "url": "https://google.com",
        "description": "Buksa i grønn versjon"
      }]
    }
    """
  }
  
}

extension Product {
    
    static let demoProducts = [
      Product.init(name: "Bukse", description: "Grå, str 32", price: 500, images: []),
      Product.init(name: "T-skjorte", description: "hvit, medium. Laget av egyptisk bomull", price: 800, images: [])
        
    ]
    
//    static func testReturnProducts() -> [Product] {
//        return [
//            Product.init(name: "Genser", description: "Brun med mønster på magen, str 34", price: 890),
//            Product.init(name: "Olabukse", description: "str 34/34", price: 1230)
//        ]
//    }
    
}
