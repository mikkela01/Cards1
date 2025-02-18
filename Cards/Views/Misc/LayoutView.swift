//
//  LayoutView.swift
//  Cards
//
//  Created by Mikkela Wilson on 2/16/25.
//

import SwiftUI

struct LayoutView: View {
  var body: some View {
    GeometryReader { proxy in
      HStack {
        Text("Hello, World!")
          .background(Color.red)
        Text("Hello, World!")
          .padding()
          .background(Color.red)
      }
      .frame(width: proxy.size.width * 0.8)
      .background(Color.gray)
      .padding(
        .leading, (proxy.size.width - proxy.size.width * 0.8) / 2)
    }
    .background(Color.yellow)
  }
}

struct LayoutView_Previews: PreviewProvider {
  static var previews: some View {
    LayoutView()
      .previewLayout(.fixed(width: 500, height: 300))
  }
}
