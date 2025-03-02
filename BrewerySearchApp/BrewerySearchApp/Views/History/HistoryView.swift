//
//  HistoryView.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

import SwiftData
import SwiftUI

struct HistoryView: View {
    let api: BreweryAPI

    @Environment(\.modelContext) private var modelContext
    @State private var selectedBrewery: SelectedBrewery?
    @Query(sort: \ViewedBrewery.viewedAt, order: .reverse) var viewedBreweries: [ViewedBrewery]

    @State private var showingAll: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .padding(.vertical)
            Text("Previously viewed")
                .font(.title.bold())
                .opacity(viewedBreweries.isEmpty ? 0 : 1)

            ForEach(showingAll ? viewedBreweries : Array(viewedBreweries.prefix(3))) { viewedBrewery in
                VStack(alignment: .leading) {
                    HistoryItemView(item: viewedBrewery)
                }
                .onTapGesture {
                    selectedBrewery = .init(id: viewedBrewery.breweryId, name: viewedBrewery.name)
                }
            }

            HStack {
                clearButton
                    .opacity(viewedBreweries.isEmpty ? 0 : 1)
                Spacer()
                showAllButton
                    .opacity(viewedBreweries.count > 3 ? 1 : 0)

            }
            .font(.caption)
        }
        .sheet(
            item: $selectedBrewery,
            content: { selectedBrewery in
                BreweryDetailsView(api: api, breweryId: selectedBrewery.id)
            })

    }
}

extension HistoryView {
    var clearButton: some View {
        Button {
            do {
                try modelContext.delete(model: ViewedBrewery.self)
            } catch {
                print(error.localizedDescription)
            }
        } label: {
            Text("Clear History")
        }
        .buttonStyle(.bordered)
    }

    var showAllButton: some View {
        Button {
            withAnimation {
                showingAll.toggle()
            }
        } label: {
            Text(showingAll ? "Show less" : "Show all")
        }
        .buttonStyle(.bordered)

    }
}

#Preview {
    let historyPreview = HistoryPreview()
    historyPreview.load(mockedData: ViewedBrewery.samples)
    return HistoryView(api: MockBrewery())
        .modelContainer(historyPreview.modelContainer)
}

struct HistoryPreview {
    let modelContainer: ModelContainer
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: ViewedBrewery.self, configurations: config)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }

    func load(mockedData: [ViewedBrewery]) {
        Task { @MainActor in
            mockedData.forEach { item in
                modelContainer.mainContext.insert(item)
            }
        }
    }

}

extension ViewedBrewery {
    static var samples: [ViewedBrewery] {
        [
            ViewedBrewery(
                breweryId: "0x001", name: "Mock Brewery #1", streetAddress: "somewhere", viewedAt: .distantPast),
            ViewedBrewery(
                breweryId: "0x002", name: "Mock Brewery #2", streetAddress: "somewhere", viewedAt: .distantPast),
            ViewedBrewery(
                breweryId: "0x003", name: "Mock Brewery #3", streetAddress: "somewhere", viewedAt: .distantPast),
            ViewedBrewery(
                breweryId: "0x004", name: "Mock Brewery #4", streetAddress: "somewhere", viewedAt: .distantPast)
        ]
    }
}
