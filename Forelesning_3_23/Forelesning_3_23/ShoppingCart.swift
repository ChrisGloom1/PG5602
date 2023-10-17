//
//  ShoppingCart.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 18/09/2023.
//

import SwiftUI

struct ShoppingCart: View {
  
  let apiClient = APIClient.error(.stolenCard)
  
  @State var isShowingError: Bool = false
  @State var shownError: APIClientError? {
    // didSet kan benyttes etter verdien er satt, mens willSet benyttes før verdien er satt
    didSet {
      if let _ = shownError {
        isShowingError = true
      } else {
        isShowingError = false
      }
    }
  }
  
  var shoppingCart: Binding<[Product]>
  @State var totalSum = 0
  
  init(shoppingCart: Binding<[Product]>) {
    self.shoppingCart = shoppingCart
    
  }
  
  func onAppear() {
    totalSum = 0
    for product in shoppingCart.wrappedValue {
      totalSum += product.price
    }
    print(totalSum)
  }
  
  func didTapPurchase() {
    Task {
      do {
        try await apiClient.purchaseProducts(shoppingCart.wrappedValue)
        shoppingCart.wrappedValue = []
        shownError = nil
      } catch let error {
        print(error)
        shownError = error as? APIClientError
        isShowingError = true
      }
    }
  }
  
  var body: some View {
    NavigationView  {
      VStack {
        List {
          ForEach(shoppingCart) { product in
            HStack {
              Text("\(product.wrappedValue.name)")
              Spacer()
              Text("\(product.wrappedValue.price) kr")
            }
          }
          HStack {
            Text("Totalt: ")
            Spacer()
            Text("\(totalSum) kr")
            
          }.bold()
        }
        Button{
          didTapPurchase()
        } label: {
          Spacer()
          Text("Kjøp \(shoppingCart.count) produkter")
            .padding(.vertical)
            .foregroundColor(.black)
          Spacer()
        }
        .buttonStyle(.bordered)
        .padding()
        .tint(.green)
      }
      .navigationTitle("Handlekurv")
    }.onAppear {
      onAppear()
    }.sheet(isPresented: $isShowingError) {
      Text("Feil ass, det var ikke bra....").foregroundColor(.red)
      
      switch shownError {
      case .stolenCard:
        Text("Kortet ditt er stjålet :(")
        WebpageView(url: URL.init(string: "https://www.politiet.no")!)
      case .notEnoughFunds:
        Text("Nah man, du er fattig :(")
      case .statusCode(let statusCode):
        Text("En feil oppsto.. StatusCode: \(statusCode)")
      case .failed(underlying: let error):
        Text("Noe feil skjedde. Kjøp en sushi og prøv igjen")
      default:
        Text("Prøv igjen eller kontakt support, bruh")
        
      }
    }
  }
}

struct ShoppingCart_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCart(shoppingCart: .constant(
      [
        Product(name: "Sokker", description: "Gule", price: 500, images: [])
      ]
    )
    )
  }
}
