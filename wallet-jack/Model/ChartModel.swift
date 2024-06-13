//
//  ChartModel.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 13.06.2024.
//

import Foundation

final class ChartModel: Identifiable {
    var category: String
    var amount: Double
    
    init(category: String, amount: Double) {
        self.category = category
        self.amount = amount
    }
}
