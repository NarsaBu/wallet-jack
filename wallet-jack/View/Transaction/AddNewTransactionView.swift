//
//  AddNewTransactionView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 31.05.2024.
//

import SwiftUI
import SwiftData

struct AddNewTransactionView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var date: Date = .now
    @State private var amount: Double = 0.0
    @State private var transactionType: Category = .EXPENSE
    @State private var note: String = ""
    @State private var desc: String = ""
    @State private var selectedCategory: IncomeExpenseCategory
    @State private var selectedAccount: Account
    var expenses: [IncomeExpenseCategory]
    var incomes: [IncomeExpenseCategory]
    var accounts: [Account]
    
    init(expenses: [IncomeExpenseCategory], incomes: [IncomeExpenseCategory], accounts: [Account]) {
        self.expenses = expenses
        self.incomes = incomes
        self.accounts = accounts
        _selectedCategory = State(initialValue: self.expenses.first ?? IncomeExpenseCategory(name: "select category", type: "expense", budget: 0.0))
        _selectedAccount = State(initialValue: self.accounts.first ?? Account(name: "select account"))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $transactionType) {
                    ForEach(Category.allCases) { option in
                        Text(option.rawValue)
                    }
                }
                .pickerStyle(.palette)
                DatePicker("Due Date", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                TextField("Amount", value: $amount, formatter: NumberFormatter())
                TextField("Note", text: $note)
                TextField("Description", text: $desc)
                buildCategoryPicker()
                buildAccountPicker()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let transaction = Transaction(date: date, amount: amount, transactionType: transactionType.rawValue, note: note, desc: desc, category: selectedCategory, account: selectedAccount)
                        
                        selectedCategory.transactions.append(transaction)
                        selectedAccount.transactions.append(transaction)
                        
                        context.insert(transaction)
                        context.insert(selectedCategory)
                        context.insert(selectedAccount)
                        
                        date = .now
                        amount = 0.0
                        transactionType = .EXPENSE
                        note = ""
                        desc = ""
                        selectedCategory = expenses.first!
                        selectedAccount = accounts.first!
                        
                        dismiss()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildCategoryPicker() -> some View {
        let categoryPicker = transactionType == .EXPENSE ? expenses : incomes
        
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
//    let expenses = [IncomeExpenseCategory(name: "name11", type: "expense", budget: 1.0), IncomeExpenseCategory(name: "name12", type: "expense", budget: 2.0)]
//    let incomes = [IncomeExpenseCategory(name: "name21", type: "income", budget: 1.0), IncomeExpenseCategory(name: "name22", type: "income", budget: 2.0)]
//    let accounts = [Account(name: "account1", assets: 0.0, liabilities: 0.0, total: 0.0), Account(name: "account2", assets: 0.0, liabilities: 0.0, total: 0.0)]
//    
//    AddNewTransactionView(expenses: expenses, incomes: incomes, accounts: accounts)
//}
