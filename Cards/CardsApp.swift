//
//  CardsApp.swift
//  Cards
//
//  Created by Mikkela Wilson on 2/7/25.
//

import SwiftUI

@main
struct CardsApp: App {
  @StateObject var store = CardStore(defaultData: false)

  var body: some Scene {
    WindowGroup {
      AppLoadingView()
        .environmentObject(store)
        .onAppear {
          print(URL.documentsDirectory)
        }
    }
  }
}
