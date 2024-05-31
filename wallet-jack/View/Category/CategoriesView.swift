//
//  CategoriesView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 23.05.2024.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var categoryEdit: IncomeExpenseCategory?
    @State private var selectedCategory: Category = .EXPENSE
    
    @Query(filter: #Predicate<IncomeExpenseCategory> { ieCategory in
        ieCategory.type == "expense"
    }) private var expenses: [IncomeExpenseCategory]
    @Query(filter: #Predicate<IncomeExpenseCategory> { ieCategory in
        ieCategory.type == "income"
    }) private var incomes: [IncomeExpenseCategory]
    
    var body: some View {
        NavigationStack {
            buildCategorySelector()
            showElementsFromCategory()
            .navigationTitle("Categories")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $categoryEdit) { category in
                EditCategoryView(category: category)
            }
            .toolbar {
                NavigationLink(destination: { AddCategoryView() }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    private func showElementsFromCategory() -> some View {
        if selectedCategory == .EXPENSE {
            return List {
                ForEach(expenses) { expense in
                   CategoryCellView(category: expense)
                       .onTapGesture {
                           categoryEdit = expense
                       }
               }
            }
        }
        
        return List {
            ForEach(incomes) { income in
                CategoryCellView(category: income)
                    .onTapGesture {
                        categoryEdit = income
                    }
            }
        }
    }
    
    @ViewBuilder
    private func buildCategorySelector() -> some View {
        Picker("", selection: $selectedCategory) {
            ForEach(Category.allCases) { period in
                Text(period.rawValue)
                    .font(.largeTitle)
            }
        }
        .pickerStyle(.segmented)
        .background(Color.secondary)
        .colorScheme(.light)
        .colorMultiply(.white)
    }
}

#Preview {
    CategoriesView()
}
