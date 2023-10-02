//
//  Forelesning_3_23Tests.swift
//  Forelesning_3_23Tests
//
//  Created by Håkon Bogen on 04/09/2023.
//

import XCTest
@testable import Forelesning_3_23

final class Forelesning_3_23Tests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func textValidProductFromJSJON() throws {
    let json = Product.sampleJSON
    let decoder = JSONDecoder()
    do {
      //Product.self returnerer typen. Product i seg selv funker ikke
      let product = try decoder.decode(Product.self, from: json.data(using: .utf8)!)
      XCTAssertEqual(product.name, "Bukse")
      XCTAssertEqual(product.description, "Kjedelig og kort")
      XCTAssertEqual(product.price, 699)
      XCTAssertEqual(product.images.count, 1)
      let productImage = product.images.first
      XCTAssertEqual(productImage?.url, "https://google.com")
      XCTAssertEqual(productImage?.description, "Buksa i grønn versjon")
    }
    catch let error {
      XCTFail(error.localizedDescription)
    }
    //    let product = Product.ID
  }
  
  func testInvalidJSON() {
    let json = """
    {
    "name" : "Bukse",
    "Description" : "Kjedelig og kort"
    }
    """
    let decoder = JSONDecoder()
    do {
      let _ = try decoder.decode(Product.self, from: json.data(using: .utf8)!)
      XCTFail("Should not make a product without price")
    } catch {
    }
  }
  
  func testAnotherProductFromJSON() throws {
    let json = """
    {
    "name" : "Bukse",
    "Description" : "Kjedelig og kort",
    "price": 699,
    "product_images": [{
      "url": "https://google.com",
      "description": "Deilig buksa a, gitt"
    }]
    }
    """
    let _ = try JSONDecoder().decode(Product.self, from: json.data(using: .utf8)!)
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
