//
//  AddNewAccountView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import SwiftUI

struct AddNewAccountView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State var enableCancelButton: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Account Name", text: $name)
            }
            .navigationTitle("Add Account")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if enableCancelButton {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Cancel") { dismiss() }
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let account = Account(name: name, assets: 0.0, liabilities: 0.0, total: 0.0)

                        context.insert(account)
                        
                        name = ""
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewAccountView(enableCancelButton: true)
}
