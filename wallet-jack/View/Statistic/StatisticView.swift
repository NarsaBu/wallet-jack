//
//  StatisticView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 13.06.2024.
//

import SwiftUI
import SwiftData
import Charts

struct StatisticView: View {
    
    @Query(filter: #Predicate<Transaction> { transaction in
        transaction.transactionType == "income"
    }, sort: \Transaction.date) private var incomes: [Transaction]
    @Query(filter: #Predicate<Transaction> { transaction in
        transaction.transactionType == "expense"
    }, sort: \Transaction.date) private var expenses: [Transaction]
    
    var body: some View {
        List {
            GroupBox ("Total Incomes Chart") {
                Chart {
                    ForEach(createChartModels(isIncomes: true)) { chartModel in
                        SectorMark(
                            angle: .value("Amount", chartModel.amount),
                            angularInset: 3.0
                        )
                        .cornerRadius(6.0)
                        .foregroundStyle(by: .value("category", chartModel.category))
                        .annotation(position: .overlay) {
                            Text("\(chartModel.amount)")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .frame(height: 500)
            GroupBox ("Total Expenses Chart") {
                Chart {
                    ForEach(createChartModels(isIncomes: false)) { chartModel in
                        SectorMark(
                            angle: .value("Amount", chartModel.amount),
                            angularInset: 3.0
                        )
                        .cornerRadius(6.0)
                        .foregroundStyle(by: .value("category", chartModel.category))
                        .annotation(position: .overlay) {
                            Text("\(chartModel.amount)")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .frame(height: 500)
        }
        .scrollIndicators(.hidden)
    }
    
    private func createChartModels(isIncomes: Bool) -> [ChartModel] {
        let groupedTransactions = isIncomes ?
        Dictionary(grouping: incomes, by: { $0.category!.name }) :
        Dictionary(grouping: expenses, by: { $0.category!.name })
        
        var chartModels: [ChartModel] = []
        
        for (category, transactions) in groupedTransactions {
            let amount = transactions
                .map({ $0.amount })
                .reduce(0, +)
            
            chartModels.append(ChartModel(category: category, amount: amount))
        }
        
        return chartModels
    }
}

#Preview {
    StatisticView()
}
