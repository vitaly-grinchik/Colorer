//
//  ValueFieldView.swift
//  Colorer
//
//  Created by Виталий Гринчик on 22.06.23.
//

import SwiftUI

struct ValueFieldView: View {
    
    var value: Double
    @State private var fieldContent = ""
    
    var body: some View {
        TextField("", text: $fieldContent)
            .bordered()
            .frame(width: 60)
    }
}

struct ValueFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ValueFieldView(value: 1.0)
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .shadow(color: .gray.opacity(0.4), radius: 4)
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}
