//
//  CardStore.swift
//  Cards
//
//  Created by Mikkela Wilson on 2/7/25.
//

import SwiftUI

class CardStore: ObservableObject {
  @Published var cards: [Card] = []
  @Published var selectedElement: CardElement?

  init(defaultData: Bool = false) {
    cards = defaultData ? initialCards : load()
  }

  func index(for card: Card) -> Int? {
    cards.firstIndex { $0.id == card.id }
  }

  func remove(_ card: Card) {
    guard let index = index(for: card) else { return }
    // remove the elements
    // remove(_:) removes the element images on disk
    for element in cards[index].elements {
      cards[index].remove(element)
    }
    // remove the card image (if there is one)
    UIImage.remove(name: card.id.uuidString)
    // remove the card details
    let path = URL.documentsDirectory
      .appendingPathComponent("\(card.id.uuidString).rwcard")
    try? FileManager.default.removeItem(at: path)
    cards.remove(at: index)
  }

  func addCard() -> Card {
    let card = Card(backgroundColor: Color.random())
    cards.append(card)
    card.save()
    return card
  }
}

extension CardStore {
  func load() -> [Card] {
    var cards: [Card] = []
    let path = URL.documentsDirectory.path
    guard
      let enumerator = FileManager.default
        .enumerator(atPath: path),
      let files = enumerator.allObjects as? [String]
    else { return cards }
    let cardFiles = files.filter { $0.contains(".rwcard") }
    for cardFile in cardFiles {
      do {
        let path = path + "/" + cardFile
        let data =
          try Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        let card = try decoder.decode(Card.self, from: data)
        cards.append(card)
      } catch {
        print("Error: ", error.localizedDescription)
      }
    }
    return cards
  }
}
