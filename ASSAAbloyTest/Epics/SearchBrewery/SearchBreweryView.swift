//
//  SearchBreweryView.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-26.
//

import SwiftUI

struct SearchBreweryView: View {
    @ObservedObject var viewModel = SearchBreweryViewModel()
    
    var body: some View {
        NavigationStack {
            setupScreen()
        }
        .onAppear() {
            viewModel.fetchHistory()
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
                        viewModel.saveItem(item: selected)
                    }
                } else {
                    if !viewModel.historyList.isEmpty {
                        HistoryView(list: viewModel.historyList)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    SearchBreweryView()
}
