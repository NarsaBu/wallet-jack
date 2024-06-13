//
//  CalendarTransactionItemView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 13.06.2024.
//

import SwiftUI
import SwiftData

struct CalendarTransactionItemView: View {
    
    @State var date: Date
    @Query private var transactions: [Transaction]
    
    init(date: Date) {
        self.date = date
        let endDate = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        _transactions = Query(filter: #Predicate<Transaction> { transaction in
            transaction.date >= date && transaction.date < endDate
        }, sort: \Transaction.date)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(transactions) { transaction in
                CalendarTransactionCellView(transaction: transaction)
                    .background(alignment: .leading) {
                        if transactions.last?.id != transaction.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 24, y: 45)
                        }
                    }
            }
        }
        .padding(.top, 15)
    }
}

//#Preview {
//    CalendarTransactionItemView()
//}
