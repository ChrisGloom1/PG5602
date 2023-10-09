//
//  APIClient.swift
//  Forelesning_3_23
//
//  Created by Christopher Glommen Andresen on 09/10/2023.
//

import Foundation
struct APIClient {
  
  var getProducts: () async throws -> [Product]
  var purchaseProducts: ([Product]) async throws -> Void
  
  
}

extension APIClient {
  static let live = APIClient(getProducts: {
    let url = URL(string: "https://github.com/ChrisGloom1/PG5602/blob/master/products.json")!
    let (data, response) = try await URLSession.shared.data(from: url)
    let products = try JSONDecoder().decode([Product].self, from: data)
    
    return products
  }, purchaseProducts: { products in
    let url = URL(string: "https://github.com/ChrisGloom1/PG5602/blob/master/products.json")!
    var urlRequest = URLRequest.init(url: url)
    urlRequest.httpMethod = "POST"
    let data = try JSONEncoder().encode(products)
    urlRequest.httpBody = data
  })
  
  static let demo = APIClient(getProducts: {
    let product = Product.init(name: "Dårlige sko", description: "Masse hull, men dgb", price: 69, images: [ProductImage]())
    let product2 = Product.init(name: "Lue med hull", description: "Passer fint om du leter etter hobo looken", price: 420, images: [ProductImage]())
    
    return [product, product2]
  }, purchaseProducts: { products in
    
  })
  
} // End of APIClient extention
