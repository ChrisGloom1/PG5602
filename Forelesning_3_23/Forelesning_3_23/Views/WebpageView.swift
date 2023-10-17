//
//  WebpageView.swift
//  Forelesning_3_23
//
//  Created by Christopher Glommen Andresen on 10/10/2023.
//

import SwiftUI
import MetricKit
import SafariServices

struct WebpageView: UIViewControllerRepresentable {
  let url: URL
  
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
  func makeUIViewController(context: Context) -> some UIViewController {
    return SFSafariViewController(url: url)
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
  
}

struct WebpageView_Previews: PreviewProvider {
    static var previews: some View {
      WebpageView(url: URL.init(string: "https://www.politiet.no")!)
    }
}
