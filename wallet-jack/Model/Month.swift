//
//  Month.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 31.05.2024.
//

import Foundation

enum Month: String, CaseIterable, Identifiable {
    
    var id : Month {
        self
    }
    
    case JANUARY = "1"
    case FEBRARY = "2"
    case MARCH = "3"
    case APRIL = "4"
    case MAY = "5"
    case JUNE = "6"
    case JULY = "7"
    case AUGUST = "8"
    case SEPTEMBER = "9"
    case OCTOBER = "10"
    case NOVEMBER = "11"
    case DECEMBER = "12"
}
