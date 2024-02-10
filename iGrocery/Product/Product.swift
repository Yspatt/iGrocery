//
//  Product.swift
//  iGrocery
//
//  Created by Yan Spatt on 10/02/24.
//

import SwiftUI
import Foundation

class Product: Identifiable {
    
    var id: String
    var title: String
    var image: String
    var price: Double
    var color: Color
    var category: Category
    
    init(id: String = UUID().uuidString, title: String, image: String, price: Double, color: Color = Color.blue, category: Category = Category.other) {
        self.id = id
        self.title = title
        self.image = image
        self.price = price
        self.color = color
        self.category = category
    }
    
    func getPrice() -> String {
        let format = self.price.formatted(.currency(code: "BRL"))
        return format
    }
}
