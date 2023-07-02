//
//  TextFieldView.swift
//  Colorer
//
//  Created by Виталий Гринчик on 22.06.23.
//

import SwiftUI

struct TextFieldView: View {
        
    @Binding var value: Double
    
    let action: () -> Void

    var body: some View {
        TextField("", value: $value, format: .number)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .frame(width: 65)
            .keyboardType(.decimalPad)
            .onChange(of: value) { newValue in validate(newValue) }
            .onSubmit { validate(value) }
    }
    
}

extension TextFieldView {
    private func validate(_ newValue: Double) {
        switch newValue {
        case 0...255: value = newValue
        case 256... : value = 255
        default: value = 0
        }
        action()
    }
    
}
