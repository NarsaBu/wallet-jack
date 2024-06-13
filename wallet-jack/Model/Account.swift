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
    @Relationship(deleteRule: .cascade) var transactions = [Transaction]()
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
