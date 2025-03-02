//
//  SearchBreweryView.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-26.
//

import SwiftUI
import SwiftData

struct SearchBreweryView: View {
    @ObservedObject private var viewModel: SearchBreweryViewModel
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Brewery.name) var history: [Brewery]
    
    init() {
        self.viewModel = SearchBreweryViewModel()
    }
    
    var body: some View {
        NavigationStack {
            setupScreen()
        }
    }
    
    func setupScreen() -> some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                
                Image("searchIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.yellow)
                
                ProgressStepsView()
                SearchView(searchText: $viewModel.query)
                
                if !viewModel.breweryList.isEmpty {
                    ResultListView(list: viewModel.breweryList,
                                   showMore: viewModel.showMore) {
                        viewModel.showAll()
                    } onBrewerySelected: { selected in
                        let item = viewModel.updateDate(item: selected)
                        modelContext.insert(item)
                        
                        do {
                            try modelContext.save()
                        } catch {
                            // Error view need to be presented, missing in figma
                        }
                    }
                } else {
                    if !history.isEmpty {
                        HistoryView()
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    @Previewable @Environment(\.modelContext) var modelContext
    
    SearchBreweryView()
}
