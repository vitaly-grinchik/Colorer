//
//  ColorerView.swift
//  Colorer
//
//  Created by Виталий Гринчик on 22.06.23.
//

import SwiftUI

struct ColorerView: View {
    
    enum Field {
        case redValueField
        case greenValueField
        case blueValueField
    }

    @State private var color = Color(red: 0.5, green: 0.5, blue: 0.5)
    
    @State private var redValue: Double = 125
    @State private var greenValue: Double = 125
    @State private var blueValue: Double = 125

    @FocusState private var focusedField: Field?
   
    var body: some View {
        VStack(spacing: 30) {
            
            ColorBoxView(color: color)
            .frame(height: 200)
            
            VStack {
                // RED UI group
                HStack {
                    Text("\(lround(redValue))")
                        .frame(width: 65)
                    SliderView(
                        tintColor: .red,
                        value: $redValue)
                    TextFieldView(value: $redValue,
                                       action: setColor
                    )
                    .focused($focusedField, equals: .redValueField)
                }

                // GREEN UI group
                HStack {
                    Text("\(lround(greenValue))")
                        .frame(width: 65)
                    SliderView(
                        tintColor: .green,
                        value: $greenValue)
                    TextFieldView(value: $greenValue,
                                       action: setColor
                    )
                    .focused($focusedField, equals: .greenValueField)
                }
                
                // BLUE UI group
                HStack {
                    Text("\(lround(blueValue))")
                        .frame(width: 65)
                    SliderView(
                        tintColor: .blue,
                        value: $blueValue)
                    TextFieldView(value: $blueValue,
                                       action: setColor
                    )
                    .focused($focusedField, equals: .blueValueField)
                }
                
                Spacer()
                Button("Reset", action: resetUI)
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
            }
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button(action: jumpUp) {
                    Image(systemName: "chevron.up")
                }
                Button(action: jumpDown) {
                    Image(systemName: "chevron.down")
                }
                Spacer()
                Button("Done") { focusedField = .none}
            }
        }
        
    }

    private func jumpUp() {
        switch focusedField {
        case .blueValueField: focusedField = .greenValueField
        case .greenValueField: focusedField = .redValueField
        default: focusedField = .blueValueField
        }
    }
    
    private func jumpDown() {
        switch focusedField {
        case .blueValueField: focusedField = .redValueField
        case .greenValueField: focusedField = .blueValueField
        default: focusedField = .greenValueField
        }
    }
        
    private func resetUI() {
        redValue = 125
        greenValue = 125
        blueValue = 125
        setColor()
    }

    private func setColor() {
        color = Color(red: (redValue / 255),
                      green: (greenValue / 255),
                      blue: (blueValue / 255)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorerView()
    }
}
