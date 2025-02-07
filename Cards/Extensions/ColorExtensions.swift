//
//  ColorExtensions.swift
//  Cards
//
//  Created by Mikkela Wilson on 2/7/25.
//

import SwiftUI

extension Color {
  static let colors: [Color] = [
    .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
  ]

  static func random() -> Color {
    colors.randomElement() ?? .black
  }
}
