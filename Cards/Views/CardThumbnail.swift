//
//  CardThumbnail.swift
//  Cards
//
//  Created by Mikkela Wilson on 2/7/25.
//

import SwiftUI

struct CardThumbnail: View {
  let card: Card

  var body: some View {
    Group {
      if let uiImage = UIImage.load(uuidString: card.id.uuidString) {
        Image(uiImage: uiImage)
          .resizable()
          .aspectRatio(contentMode: .fit)
      } else {
        card.backgroundColor
      }
    }
    .cornerRadius(10)
    .shadow(
      color: Color("shadow-color"),
      radius: 3,
      x: 0.0,
      y: 0.0)
  }
}

struct CardThumbnail_Previews: PreviewProvider {
  static var previews: some View {
    CardThumbnail(card: initialCards[0])
      .frame(
        width: Settings.thumbnailSize.width,
        height: Settings.thumbnailSize.height)
  }
}
