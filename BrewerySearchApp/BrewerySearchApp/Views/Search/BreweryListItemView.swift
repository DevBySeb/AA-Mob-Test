//
//  BreweryListItemView.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

import SwiftUI

struct BreweryListItem: Identifiable {
    let id: String
    let name: String
    let city: String
    let country: String

    init(brewery: Brewery) {
        self.id = brewery.id
        self.name = brewery.name
        self.city = brewery.city ?? "Unknown City"
        self.country = brewery.country ?? "Unknown Country"
    }

    init(id: String, name: String, city: String, country: String) {
        self.id = id
        self.name = name
        self.city = city
        self.country = country
    }

    static let sample: BreweryListItem = .init(id: "1", name: "ColdBar", city: "London", country: "United Kingdom")
    static let samples: [BreweryListItem] = [
        .init(id: "2", name: "NamelessBar", city: "Berlin", country: "Germany"),
        .init(id: "3", name: "NamedBar", city: "Paris", country: "France")
    ]
}

struct BreweryListItemView: View {
    let brewery: BreweryListItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(brewery.name)
                    .font(.headline)
                Spacer()
            }
            HStack {
                Text("\(brewery.city) - \(brewery.country)")
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 1))

    }
}

#Preview {
    BreweryListItemView(brewery: BreweryListItem.sample)
        .padding()
}
