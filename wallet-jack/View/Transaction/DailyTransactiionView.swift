//
//  DailyTransactiionView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 31.05.2024.
//

import SwiftUI
import SwiftData

struct DailyTransactiionView: View {
    
    @Environment(\.modelContext) private var context
    
    @State
    var selectedDate: Date
    @State private var transactionEdit: Transaction?
    
    @Query(sort: \Transaction.date) var transactions: [Transaction]
    
    @Query(filter: #Predicate<IncomeExpenseCategory> { ieCategory in
        ieCategory.type == "expense"
    }) private var expenses: [IncomeExpenseCategory]
    @Query(filter: #Predicate<IncomeExpenseCategory> { ieCategory in
        ieCategory.type == "income"
    }) private var incomes: [IncomeExpenseCategory]
    @Query private var accounts: [Account]
    
    init(selectedDate: Date) {
        self.selectedDate = selectedDate
        
        let endDate = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: selectedDate)!
        
        _transactions = Query(filter: #Predicate<Transaction> { transaction in
            transaction.date >= selectedDate && transaction.date < endDate
        }, sort: \Transaction.date)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(selectedDate, format: .dateTime.day().month())
                    .fontWeight(.bold)
                    .font(.system(size: 26))
                Spacer()
                Text("\(String(format: "%.2f", countTotalIncomes()))")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundStyle(.green)
                Text("\(String(format: "%.2f", countTotalExpenses()))")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundStyle(.red)
            }
            .padding()
            List {
                ForEach(transactions) { transaction in
                    TransactionCellView(transaction: transaction)
                        .onTapGesture {
                            transactionEdit = transaction
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(transactions[index])
                    }
                }
            }
            .sheet(item: $transactionEdit) { transaction in
                EditTransactionView(transaction: transaction, expenses: expenses, incomes: incomes, accounts: accounts)
            }
        }
    }
    
    private func countTotalIncomes() -> Double {
        return transactions
            .filter({ $0.transactionType == "income" })
            .map({ $0.amount })
            .reduce(0, +)
    }
    
    private func countTotalExpenses() -> Double {
        return transactions
            .filter({ $0.transactionType == "expense" })
            .map({ $0.amount })
            .reduce(0, +)
    }
}

#Preview {
    DailyTransactiionView(selectedDate: Date.now)
}
