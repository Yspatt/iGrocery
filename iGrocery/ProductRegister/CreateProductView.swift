//
//  CreateProductView.swift
//  iGrocery
//
//  Created by Yan Spatt on 10/02/24.
//

import SwiftUI

struct CreateProductView: View {
    
    @AppStorage("name") private var name: String = ""
    @AppStorage("price") private var price: Double = 0.0
    
    var body: some View {
        
        VStack(spacing: 50) {
            Text("Informações do produto")
                .font(.system(size: 32, weight: .semibold, design: .rounded))
                .frame(width: 350, alignment: .leading)
            
            Form {
                TextField("Nome do Produto",text: $name)
            }
        }
        .navigationBarTitle("Criar Produto")
    }
}

#Preview {
    CreateProductView()
}
