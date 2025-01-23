//
//  AddView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @Environment(ListViewModel.self) private var vm
    @Environment(\.dismiss) private var dismiss
    
    @State var alertTitle: String = "the title"
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("enter the item...", text: $textFieldText)
                    .padding(.leading)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    saveButtonPressed()
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
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Ok") { }
        }
        
    }
    
    func saveButtonPressed() {
        if !textIsAppropriate() {
            alertTitle = "Your new item must be at least 3 characters long ⚠️"
            showAlert.toggle()
        }
        else {
            vm.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        textFieldText.count >= 3
    }
    
}

#Preview {
    NavigationStack {
        AddView()
    }
    .environment(DeveloperPreview.shared.vm)
}
