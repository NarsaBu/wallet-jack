//
//  AddCategoryView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 23.05.2024.
//

import SwiftUI

struct AddCategoryView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var type: Category = .EXPENSE
    @State private var budget: Double = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Category.allCases) { option in
                        Text(option.rawValue)
                    }
                }
                type == .EXPENSE ? TextField("Budget per Month", value: $budget, formatter: NumberFormatter()) : nil
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let category = IncomeExpenseCategory(name: name, type: type.rawValue, budget: budget)
                        
                        context.insert(category)
                        
                        name = ""
                        type = .EXPENSE
                        budget = 0.0
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddCategoryView()
}
