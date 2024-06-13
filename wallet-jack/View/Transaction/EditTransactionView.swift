//
//  EditTransactionView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 13.06.2024.
//

import SwiftUI

struct EditTransactionView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var transaction: Transaction
    @State private var selectedCategory: IncomeExpenseCategory
    @State private var selectedAccount: Account
    var expenses: [IncomeExpenseCategory]
    var incomes: [IncomeExpenseCategory]
    var accounts: [Account]
    
    init(transaction: Transaction, expenses: [IncomeExpenseCategory], incomes: [IncomeExpenseCategory], accounts: [Account]) {
        self.transaction = transaction
        self.expenses = expenses
        self.incomes = incomes
        self.accounts = accounts
        _selectedCategory = State(initialValue: self.expenses.first ?? IncomeExpenseCategory(name: "select category", type: "expense", budget: 0.0))
        _selectedAccount = State(initialValue: self.accounts.first ?? Account(name: "select account"))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $transaction.transactionType) {
                    ForEach(Category.allCases) { option in
                        Text(option.rawValue)
                    }
                }
                .pickerStyle(.palette)
                DatePicker("Due Date", selection: $transaction.date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                TextField("Amount", value: $transaction.amount, formatter: NumberFormatter())
                TextField("Note", text: $transaction.note)
                TextField("Description", text: $transaction.desc)
                buildCategoryPicker()
                buildAccountPicker()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") { dismiss() }
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildCategoryPicker() -> some View {
        let categoryPicker = transaction.transactionType == "expense" ? expenses : incomes
        
        Picker("Category", selection: $selectedCategory) {
            ForEach(categoryPicker, id: \.self) { category in
                Text(category.name)
            }
        }
        .pickerStyle(.menu)
    }
    
    @ViewBuilder
    private func buildAccountPicker() -> some View {
        Picker("Account", selection: $selectedAccount) {
            ForEach(accounts, id: \.self) { account in
                Text(account.name)
            }
        }
        .pickerStyle(.menu)
    }
}

//#Preview {
//    EditTransactionView()
//}
