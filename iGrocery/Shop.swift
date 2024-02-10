//
//  Shop.swift
//  iGrocery
//
//  Created by Yan Spatt on 09/02/24.
//

import SwiftUI

struct Shop: View {
    
    @State var goToCart = false
    @State var goToRegister = false
    @State var goToAccount = false
    @AppStorage("filter") private var filter: Category = .fruits
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var products:[Product] = avaliableItems
    var body: some View {
        VStack(spacing: 5) {
            VStack {
                Text("Bom dia,")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(.gray)
                Text("Vamos pedir itens frescos\npara você!")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .frame(width: 320, alignment: .leading)
                
                Spacer().frame(height: 10)
                Text("Produtos Frescos para sua disposição")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(.gray)
                Form {
                    Section(header: Text("Filtro")) {
                        Picker("Categoria", selection: $filter) {
                            ForEach(Category.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                .frame(width: 320,height: 100)
                .presentationCornerRadius(10.0)
                
            }.padding(20)
            ScrollView() {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(products) { product in
                        (product.category == self.filter) ?
                        AnyView(ShopItem(imageName: product.image, title: product.title, price: product.getPrice(), color: product.color, id: product.id)) : AnyView(EmptyView())
                        
                    }
                }
            }.padding(15)
        }
        .navigationDestination(isPresented: $goToCart) {
            Cart()
        }
        .navigationDestination(isPresented: $goToRegister) {
            CreateProductView()
        }
        .toolbar {
            
            ToolbarItem(placement: .bottomBar) {
                Button() {
                    goToRegister = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button() {
                    goToAccount = true
                } label: {
                    Image(systemName: "person.circle")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button() {
                    goToCart = true
                } label: {
                    Image(systemName: "cart")
                }
            }
        }.navigationTitle("Loja")
    }
}

#Preview {
    Shop()
}
