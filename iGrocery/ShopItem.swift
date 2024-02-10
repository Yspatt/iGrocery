//
//  ShopItem.swift
//  iGrocery
//
//  Created by Yan Spatt on 09/02/24.
//

import SwiftUI

struct ShopItem: View {
    
    var imageName: String
    var title: String
    var price: String
    var color: Color
    var id: String
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
                .opacity(0.25)
                .frame(width: 170,height: 230)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Text(title)
                Button () {
                    let result = avaliableItems.filter { $0.id == id}
                    cartItems.append(result[0])
                    showAlert = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text(price)
                            .foregroundStyle(.white)
                            .frame(width: 100, height: 40)
                    }.padding(.top,10)
                }.frame(width: 50, height: 20)
                    .foregroundColor(color)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Sucesso!"),
                            message: Text("Item adicionado ao carrinho!")
                        )
                    }
            }
        }
    }
}

#Preview {
    ShopItem(imageName: "banana", title: "Banana", price: "R$ 10", color: Color.green, id: "")
}
