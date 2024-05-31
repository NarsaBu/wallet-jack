//
//  Account.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import Foundation
import SwiftData

@Model
final class Account {
    var id: UUID
    var name: String
    var assets: Double
    var liabilities: Double
    var total: Double
    @Relationship(deleteRule: .cascade) var transactions = [Transaction]()
    
    init(name: String, assets: Double, liabilities: Double, total: Double) {
        self.id = UUID()
        self.name = name
        self.assets = assets
        self.liabilities = liabilities
        self.total = total
    }
}
