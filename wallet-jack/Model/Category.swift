//
//  Category.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    
    var id : Category {
        self
    }
    
    case INCOME = "income"
    case EXPENSE = "expense"
}
