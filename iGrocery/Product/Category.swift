//
//  Category.swift
//  iGrocery
//
//  Created by Yan Spatt on 10/02/24.
//

import Foundation

enum Category: String, CaseIterable {
    
    case fruits = "Frutas Frescas"
    case drinks = "Bebidas"
    case meats = "Carnes"
    case other = "Outros"
}

extension Category: Identifiable {
  var id: Self { self }
}
