//
//  Transaction.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    var id: UUID
    var date: Date
    var amount: Double
    var transactionType: String
    var note: String
    var desc: String
    var category: IncomeExpenseCategory?
    var account: Account?
    
    init(date: Date, amount: Double, transactionType: String, note: String, desc: String, category: IncomeExpenseCategory? = nil, account: Account? = nil) {
        self.id = UUID()
        self.date = date
        self.amount = amount
        self.transactionType = transactionType
        self.note = note
        self.desc = desc
        self.category = category
        self.account = account
    }
}
