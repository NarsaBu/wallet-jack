//
//  CategoryCellView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 23.05.2024.
//

import SwiftUI

struct CategoryCellView: View {
    
    var category: IncomeExpenseCategory
    
    var body: some View {
        HStack {
            Text(category.name)
            Spacer()
            category.type == "expense" ? Text("\u{20BD} -\(String(format: "%.2f", category.budget))") : nil
        }
    }
}

#Preview {
    CategoryCellView(category: IncomeExpenseCategory(name: "food", type: "expense", budget: 1234.0))
}
