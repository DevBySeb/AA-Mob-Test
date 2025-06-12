//
//  ShopDetailsView.swift
//  Outings
//
//  Created by Mostafa Mazrouh on 2025-06-12.
//

import SwiftUI
import SwiftData


struct ShopDetailsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @Query private var storedShops: [Shop]
    
    let shop: Shop
    
    var body: some View {
        VStack {
            Image("Slider indicator")
                .padding()
                .padding(.bottom, 30)
            
            Text(shop.address1 ?? shop.id.uuidString)
                .font(.poppinsSemiBold24)
                .padding(.bottom, 40)
                .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Address")
                        .font(.poppinsSemiBold16)
                    Spacer()
                }
                
                HStack {
                    Text("\(shop.address1 ?? "No address"), \(shop.city ?? "No city")")
                        .font(.poppinsRegular16)
                    Spacer()
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 40)
            
            Spacer()
            
            Button("Back") {
                dismiss()
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color.appBlue)
            .cornerRadius(50)
            .padding(.horizontal, 25)
            .padding(.bottom, 40)
        }
        .onAppear {
            if !storedShops.contains(where: { $0.id == shop.id }) {
                shop.createdAt = Date.now
                modelContext.insert(shop)
                try? modelContext.save()
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(Color.appDark.ignoresSafeArea())
    }
}
