//
//  CoolTextViewStyle.swift
//  Forelesning_3_23
//
//  Created by Christopher Glommen Andresen on 16/10/2023.
//

import Foundation
import SwiftUI

struct CoolTextFieldStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .textFieldStyle(.roundedBorder)
      .overlay(RoundedRectangle(cornerRadius: 6).fill(.clear))
  }
}

struct CooltextFieldStylePreview: View {
  @State var nameText = ""
  @State var phoneText = ""
  var body: some View {
    VStack{
      TextField("Navn", text: $nameText)
        .modifier(CoolTextFieldStyle())
      TextField("Telefonnummer", text: $phoneText)
        .modifier(CoolTextFieldStyle())
    }
    .padding(.horizontal)
  }
}

extension View {
  static var coolTextFieldStyle: any View {
    fatalError()
  }
}


struct CoolTextFieldStyle_Previews: PreviewProvider {
  static var previews: some View {
    CooltextFieldStylePreview()
  }
}
