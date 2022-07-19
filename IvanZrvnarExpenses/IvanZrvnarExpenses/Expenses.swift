//
//  Expenses.swift
//  IvanZrvnarExpenses
//
//  Created by Ivan Zrvnar on 2022-06-28.
//

import Foundation
struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
