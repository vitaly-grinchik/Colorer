//
//  SliderView.swift
//  Colorer
//
//  Created by Виталий Гринчик on 22.06.23.
//

import SwiftUI

struct SliderView: View {
    
    let tintColor: Color
    
    @Binding var value: Double

    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .tint(tintColor)
            .animation(.default)
    }
}
