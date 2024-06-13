//
//  TransactionView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import SwiftUI
import SwiftData

struct TransactionView: View {
    
    @State private var selectedDate: Date = Date.now
    
    @Query(filter: #Predicate<IncomeExpenseCategory> { ieCategory in
        ieCategory.type == "expense"
    }) private var expenses: [IncomeExpenseCategory]
    @Query(filter: #Predicate<IncomeExpenseCategory> { ieCategory in
        ieCategory.type == "income"
    }) private var incomes: [IncomeExpenseCategory]
    @Query private var accounts: [Account]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                buildYearSelector()
                ZStack(alignment: .bottomTrailing) {
                    DailyTransactiionView(selectedDate: Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: selectedDate)!)
                    NavigationLink(destination: AddNewTransactionView(expenses: expenses, incomes: incomes, accounts: accounts)) {
                        Image(systemName: "plus")
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.white)
                            .background(Color.pink)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.5), radius: 10)
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.pink, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    @ViewBuilder
    private func buildYearSelector() -> some View {
        HStack {
            Button(action: {
                decrementSelectedYear()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            })
            Spacer()
            Text(selectedDate, format: .dateTime.day().month().year())
                .font(.title3)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                incrementSelectedYear()
            }, label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            })
        }
        .padding()
        .background(Color.pink)
        .colorScheme(.dark)
    }
    
    private func incrementSelectedYear() {
        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)!
    }
    
    private func decrementSelectedYear() {
        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate)!
    }
}

#Preview {
    TransactionView()
}
