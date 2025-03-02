//
//  SearchView.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

import SwiftData
import SwiftUI

enum SearchState {
    case initial
    case loading
    case loaded([BreweryListItem])
    case failed(String)
}

final class SearchViewModel: ObservableObject {

    let breweryApi: BreweryAPI

    @Published var searchState: SearchState = .initial

    init(api: BreweryAPI) {
        breweryApi = api
    }

    func search(query: String) async {
        Task { @MainActor in
            do {
                searchState = .loading
                let response = try await breweryApi.search(query: query)
                    .map { BreweryListItem.init(brewery: $0) }
                searchState = .loaded(response)
            } catch {
                searchState = .failed(error.localizedDescription)
            }
        }
    }

    func clearSearch() {
        searchState = .initial
    }
}

struct SelectedBrewery: Identifiable {
    let id: String
    let name: String
}

struct SearchView: View {

    let api: BreweryAPI
    @StateObject var viewModel: SearchViewModel

    @State private var searchText: String = ""
    @State private var showAllResults: Bool = false
    @State private var selectedBrewery: SelectedBrewery?

    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ViewedBrewery.viewedAt, order: .reverse) var viewedBreweries: [ViewedBrewery]

    init(api: BreweryAPI) {
        self.api = api
        self._viewModel = StateObject(wrappedValue: SearchViewModel(api: api))
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                searchImage
                    .padding()
                VStack(alignment: .leading) {
                    searchBar
                    searchResults
                    HistoryView(api: api)
                        .padding(.top)
                }
                .padding()
            }
            .padding()
            .sheet(
                item: $selectedBrewery,
                content: { selectedBrewery in
                    BreweryDetailsView(api: api, breweryId: selectedBrewery.id)
                }
            )
            .navigationTitle("Search for a Brewery")
        }
    }
}

extension SearchView {
    var searchImage: some View {
        Image("magglass")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 125)
            .background(.gray)
    }

    var searchBar: some View {
        HStack {
            TextField("Enter search text", text: $searchText)

            Button {
                withAnimation {
                    searchText = ""
                    viewModel.clearSearch()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.medium)
            }
            .opacity(searchText.isEmpty ? 0 : 1)

            Button {
                Task {
                    await viewModel.search(query: searchText)
                }
            } label: {
                Text("Search")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(.gray, lineWidth: 2)
        )
    }

    @ViewBuilder
    var searchResults: some View {
        VStack {
            switch viewModel.searchState {
            case .initial:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded(let results):
                VStack {
                    if results.isEmpty {
                        HStack {
                            Text("No results found. Try a different search query")
                                .font(.title)
                        }
                    }
                    ForEach(results.prefix(showAllResults ? 10 : 5)) { breweryListItem in
                        BreweryListItemView(brewery: breweryListItem)
                            .onTapGesture {
                                selectedBrewery = .init(id: breweryListItem.id, name: breweryListItem.name)
                                saveToViewedList()
                            }
                    }
                    HStack {
                        Button {
                            withAnimation {
                                showAllResults.toggle()
                            }
                        } label: {
                            Text(showAllResults ? "Show less" : "Show more")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .opacity(results.count < 5 ? 0 : 1)
                    }

                }
            case .failed(let error):
                Text(error)
            }
        }
    }

    func saveToViewedList() {
        guard let selectedBrewery = selectedBrewery else { return }
        do {
            let viewedBrewery = ViewedBrewery(
                breweryId: selectedBrewery.id, name: selectedBrewery.name, streetAddress: "", viewedAt: .now)
            modelContext.insert(viewedBrewery)
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

}

#Preview {
    let historyPreview = HistoryPreview()
    historyPreview.load(mockedData: ViewedBrewery.samples)
    return SearchView(api: MockBrewery())
        .modelContainer(historyPreview.modelContainer)
}
