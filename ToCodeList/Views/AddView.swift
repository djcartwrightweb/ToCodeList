//
//  AddView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("enter the item...", text: $textFieldText)
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    //
                } label: {
                    Text("Save -> 💾".uppercased())
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.top)

                    
            }
            .padding()
        }
        .navigationTitle("Add an Item 👨‍💻")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
