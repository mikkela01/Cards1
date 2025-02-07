//
//  ToolbarSelection.swift
//  Cards
//
//  Created by Mikkela Wilson on 2/7/25.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
  var id: Int {
    hashValue
  }

  case photoModal, frameModal, stickerModal, textModal
}
