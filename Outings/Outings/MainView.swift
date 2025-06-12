//
//  MainView.swift
//  Outings
//
//  Created by Mostafa Mazrouh on 2025-06-07.
//

import SwiftUI
import SwiftData


struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var storedShops: [Shop]
    
    @Bindable private var viewModel: ShopVM
    @State private var showAllShops = false
    
    @State private var selectedShop: Shop? = nil
    @State private var navigationPath = NavigationPath()
    
    init(viewModel: ShopVM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                staticViews()
                
                searchBar()
                
                if !viewModel.searchText.trimmingCharacters(in: .whitespaces).isEmpty {
                    searchView()
                } else {
                    historyView()
                }
                Spacer()
            }
            .navigationDestination(for: Shop.self) { shop in
                ShopDetailsView(shop: shop)
            }
            .background(Color.appDark)
        }
        .tint(Color.white)
    }
    
    @ViewBuilder
    func staticViews() -> some View {
        VStack {
            Image("Group 4")
                .padding(.top, 40)
            
            Image("Slider indicator")
                .padding(.top, 20)
            
            Text("Search for a  brewery")
                .font(.poppinsSemiBold24)
                .foregroundStyle(Color.white)
                .font(.title2)
                .padding(.top, 40)
        }
    }
    
    @ViewBuilder
    func searchBar() -> some View {
        HStack {
            TextField("", text: $viewModel.searchText, prompt: Text("Search...").foregroundColor(.white.opacity(0.7)))
            
            if !viewModel.searchText.isEmpty {
                Button(action: { viewModel.searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white, lineWidth: 1)
        )
        .foregroundColor(.white)
        .padding()
    }
    
    @ViewBuilder
    func searchView() -> some View {
        List {
            ForEach((showAllShops ? viewModel.shops : Array(viewModel.shops.prefix(5))), id: \.id) { shop in
                NavigationLink(value: shop) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(shop.address1 ?? (shop.name ?? shop.id.uuidString))")
                            .font(.poppinsSemiBold16)
                            .foregroundColor(.white)
                    }
                }
                .listRowBackground(Color.clear)
            }
            
            if viewModel.shops.count > 5 {
                Button(showAllShops ? "Show less" : "Show more") {
                    withAnimation {
                        showAllShops.toggle()
                    }
                }
                .font(.poppinsRegular16)
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.clear)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.white, lineWidth: 1)
                )
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .background(Color.appGray)
        .cornerRadius(12)
        .padding()
    }
    
    @ViewBuilder
    func historyView() -> some View {
        VStack {
            HStack {
                Text("History")
                    .font(.poppinsSemiBold16)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Spacer()
            }
            .padding(.leading, 20)
            
            List {
                ForEach(storedShops, id: \.id) { shop in
                    NavigationLink(value: shop) {
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text("\(shop.address1 ?? (shop.name ?? shop.id.uuidString))")
                                .font(.poppinsRegular16)
                            
                            if let createdAt = shop.createdAt {
                                Text("Added: \(DateFormatter.shopDateFormatter.string(from: createdAt))")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.poppinsRegular13)
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .listRowBackground(Color.clear)
                }
                .onDelete { indices in
                    for index in indices {
                        let shopToDelete = storedShops[index]
                        modelContext.delete(shopToDelete)
                        try? modelContext.save()
                    }
                }
            }
            .listStyle(.plain)
            .background(Color.appDark)
            .cornerRadius(12)
        }
    }
}

#Preview {
    MainView(viewModel: ShopVM(repo: ShopRepoMock()))
        .modelContainer(for: Shop.self, inMemory: true)
}


