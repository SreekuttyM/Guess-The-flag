//
//  FlagImage.swift
//  Guess-The-Flag
//
//  Created by Sreekutty Maya on 16/04/2024.
//

import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content.clipShape(.capsule).shadow(radius: 5)
    }
}

extension View {
    func setFlagImage() -> some View {
        modifier(FlagImage())
    }
}
