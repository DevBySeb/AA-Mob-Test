//
//  BreweryDetailsView.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

import SwiftUI

final class BreweryDetailsViewModel: ObservableObject {
    @Published var brewery: Brewery?

    let breweryApi: BreweryAPI
    init(api: BreweryAPI) {
        breweryApi = api
    }

    func getBrewery(id: String) async {
        Task {
            do {
                let response = try await breweryApi.details(breweryId: id)
                await MainActor.run {
                    self.brewery = response
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct BreweryDetailsView: View {
    let api: BreweryAPI
    let breweryId: String

    @StateObject var viewModel: BreweryDetailsViewModel

    @Environment(\.modelContext) private var modelContext

    init(api: BreweryAPI, breweryId: String) {
        self.api = api
        self.breweryId = breweryId
        self._viewModel = StateObject(wrappedValue: BreweryDetailsViewModel(api: api))
    }

    var body: some View {
        VStack {
            if let brewery = viewModel.brewery {
                Form {
                    Text(brewery.name)
                        .font(.largeTitle)

                    Section {
                        Text(brewery.displayType)
                    } header: {
                        Text("Type")
                    }

                    Section {
                        Text(brewery.displayAddress)
                    } header: {
                        Text("Address")
                    }

                    Section {
                        Text(brewery.displayPhone)
                    } header: {
                        Text("Contact")
                    }

                    Section {
                        Text(brewery.displayWebsite)
                    } header: {
                        Text("Website")
                    }
                }
            }
        }
        .task {
            await viewModel.getBrewery(id: breweryId)
        }
    }
}

#Preview {
    BreweryDetailsView(api: MockBrewery(), breweryId: "1")
}
