//
//  IncomeExpenseCategory.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import Foundation
import SwiftData

@Model
final class IncomeExpenseCategory {
    var id: UUID
    var name: String
    var type: String
    var budget: Double
    @Relationship(deleteRule: .cascade) var transactions = [Transaction]()
    
    init(name: String, type: String, budget: Double) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.budget = budget
    }
}
