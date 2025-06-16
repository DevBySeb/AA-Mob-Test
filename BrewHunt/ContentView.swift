//
//  ContentView.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-10.
//

import SwiftUI

struct ContentView: View {
    let httpClient = HTTPClientWrapper().client
    @State private var breweries: [BreweryItem] = []

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 8.0) {
                    // TODO: 🔥 fix it later
                    ForEach(breweries, id: \.id) { brewery in
                        OptionalTextView(value: brewery.id)
                        OptionalTextView(value: brewery.name)
                        OptionalTextView(value: brewery.breweryType)
                        OptionalTextView(value: brewery.address1)
                        OptionalTextView(value: brewery.address2)
                        OptionalTextView(value: brewery.address3)
                        OptionalTextView(value: brewery.city)
                        OptionalTextView(value: brewery.stateProvince)
                        OptionalTextView(value: brewery.postalCode)
                        OptionalTextView(value: brewery.country)
                        OptionalTextView(value: brewery.longitude)
                        OptionalTextView(value: brewery.latitude)
                        OptionalTextView(value: brewery.phone)
                        OptionalTextView(value: brewery.websiteURL)
                        OptionalTextView(value: brewery.state)
                        OptionalTextView(value: brewery.street)

                        Text("********************************")
                    }
                }
            }

            Button("Fetch Breweries") {
                Task {
                    do {
                        let endpoint = BrewerySearchEndpoint()
                        breweries = try await httpClient.submitRequest(endpoint: endpoint) ?? []
                    } catch {
                        print("Error fetching breweries: \(error)")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct OptionalTextView<Value: CustomStringConvertible>: View {
    let value: Value?

    var body: some View {
        if let value = value {
            Text(String(describing: value))
        } else {
            EmptyView()
        }
    }
}
