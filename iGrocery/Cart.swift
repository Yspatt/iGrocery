//
//  Cart.swift
//  iGrocery
//
//  Created by Yan Spatt on 09/02/24.
//

import SwiftUI
import UserNotifications

struct Cart: View {
    
    @State var totalPrice = 0.00
    
    var body: some View {
        VStack {
            Text("Meu Carrinho")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            List {
                ForEach(cartItems) { product in
                    HStack {
                        Image(product.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(spacing: 5) {
                            Text(product.title)
                            Text(product.getPrice())
                                .foregroundStyle(.gray)
                        }
                    }
                }.onDelete{indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    self.calculateTotalPrice()
                }
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.green)
                    .opacity(0.8)
                    .frame(width: 350, height: 120)
                VStack {
                    Text("Total da compra")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                    Text(totalPrice.formatted(.currency(code: "BRL")))
                        .foregroundStyle(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(width: 350,alignment: .leading)
                        .padding(.leading,60)
                }
                Button() {
                    self.finish()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder()
                            .frame(width: 120, height: 50)
                            .foregroundStyle(.white)
                        Text("Pagar agora >")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }.offset(x: 80)
            }
        }.onAppear(perform: {
            self.calculateTotalPrice()
        })
        .navigationTitle("Carrinho")
    }
    
    func calculateTotalPrice() {
        totalPrice = 0.00
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i].price
        }
    }
    
    func finish() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error {
                print(error.localizedDescription)
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Pedido #1"
        content.body = "Seu pedido foi efetuado com sucesso!"
        content.badge = 1
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger )


        // Schedule the request with the system.
        UNUserNotificationCenter.current().add(request)
        
    }
}

#Preview {
    Cart()
}
