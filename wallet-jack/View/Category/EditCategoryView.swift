//
//  EditCategoryView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 23.05.2024.
//

import SwiftUI

struct EditCategoryView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var category: IncomeExpenseCategory
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $category.name)
                category.type == "expense" ? TextField("Budget per Month", value: $category.budget, formatter: NumberFormatter()) : nil
            }
            .navigationTitle("Edit \(category.type.capitalized)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    EditCategoryView(category: IncomeExpenseCategory(name: "food", type: "income", budget: 1234.0))
}
