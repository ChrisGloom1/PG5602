//
//  ShoppingCart.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 18/09/2023.
//

import SwiftUI

struct ShoppingCart: View {
  
  var shoppingCart: Binding<[Product]>
<<<<<<< Updated upstream
=======
  @State var totalSum: Int = 0
>>>>>>> Stashed changes
  
  init(shoppingCart: Binding<[Product]>) {
    self.shoppingCart = shoppingCart
  }
  
<<<<<<< Updated upstream
=======
  func onAppear() {
    totalSum = 0
    for product in shoppingCart {
      totalSum += product.wrappedValue.price
    }
    print(totalSum)
  }
  
>>>>>>> Stashed changes
  var body: some View {
    NavigationView  {
      List {
        ForEach(shoppingCart) { product in
<<<<<<< Updated upstream
          Text("\(product.wrappedValue.name) - \(product.wrappedValue.price) kr")
        }
      }
      .navigationTitle("Handlekurv")
=======
          HStack{
            Text("\(product.wrappedValue.name)")
            Spacer()
            Text("\(product.wrappedValue.price) kr")
          }
        }
        HStack{
          Text("Total:")
          Spacer()
          Text("\(totalSum) kr")
        }
        .bold()
        .foregroundColor(.blue)
      }
      
      .navigationTitle("Handlekurv")
    }.onAppear{
      onAppear()
>>>>>>> Stashed changes
    }
  }
}

struct ShoppingCart_Previews: PreviewProvider {
  static var previews: some View {
    ShoppingCart(shoppingCart: .constant(
      [
<<<<<<< Updated upstream
        Product(name: "Bøttehatt", description: "Jækla schtøgg", price: 420, images: [])
      ]
    ))
=======
        Product(name: "Sokker", description: "Gule", price: 500, images: [])
      ]
    )
    )
>>>>>>> Stashed changes
  }
}
