//
//  TransactionView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import SwiftUI
import SwiftData

struct TransactionView: View {
    
    @State private var selectedYear: Int = Date().getCurrentYear()
    @State private var selectedMonthNumber: Int = Date().getCurrentMonth()
    @State private var selectedMonth: Month = Date().getCurrentMonthEnum()
    @State private var selectedPeriod: PeriodSelector = .DAILY
    
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
                buildPeriodSelector()
                ZStack {
                    NavigationLink(destination: AddNewTransactionView(expenses: expenses, incomes: incomes, accounts: accounts)) {
                        Image(systemName: "plus")
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color.white)
                            .background(Color.pink)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.5), radius: 10)
                    }
                }
                Spacer()
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.pink, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        //TODO: add find
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //TODO: add sort
                    }, label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundColor(.white)
                    })
                }
            }
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
            Text("\(selectedMonth) \(selectedYear)")
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
    
    @ViewBuilder
    private func buildPeriodSelector() -> some View {
        Picker("", selection: $selectedPeriod) {
            ForEach(PeriodSelector.allCases) { period in
                Text(period.rawValue)
                    .font(.largeTitle)
                    .background(Color.pink)
            }
        }
        .pickerStyle(.segmented)
        .background(Color.pink)
        .colorScheme(.dark)
        .colorMultiply(.white)
    }
    
    private func incrementSelectedYear() {
        if selectedMonthNumber == 12 {
            selectedMonthNumber = 1
            selectedYear += 1
        } else {
            selectedMonthNumber += 1
        }
        
        selectedMonth = Month(rawValue: "\(selectedMonthNumber)")!
    }
    
    private func decrementSelectedYear() {
        if selectedMonthNumber == 1 {
            selectedMonthNumber = 12
            selectedYear -= 1
        } else {
            selectedMonthNumber -= 1
        }
        
        selectedMonth = Month(rawValue: "\(selectedMonthNumber)")!
    }
}

#Preview {
    TransactionView()
}
