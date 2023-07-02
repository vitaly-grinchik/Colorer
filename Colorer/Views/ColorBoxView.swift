//
//  ColorBoxView.swift
//  Colorer
//
//  Created by Виталий Гринчик on 22.06.23.
//

import SwiftUI

struct ColorBoxView: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(color)
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color(.systemBlue), lineWidth: 5)
            )
    }
}

struct ColorBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ColorBoxView(color: .white)
    }
}
