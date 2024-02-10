//
//  ContentView.swift
//  iGrocery
//
//  Created by Yan Spatt on 09/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var changeScreen = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                Text("Nós entregamos na porta da sua casa!")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                
                Text("Com o iGrocery,\n você compra produtos frescos e baratos \n Peça já!")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                Button() {
                    changeScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text("Começar!")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }.frame(width: 200, height: 70)
                    .foregroundColor(.green)
            }
            .navigationDestination(isPresented: $changeScreen) {
                Shop()
            }
        }
    }
}

#Preview {
    ContentView()
}
