//
//  HistoryItemView.swift
//  BrewerySearchApp
//
//  Created by Prakash Rajendran on 2025-03-01.
//

import SwiftUI

struct HistoryItemView: View {
    let item: ViewedBrewery

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.name)
                    .bold()
                Spacer()
            }
            HStack {
                Text("viewed at \(item.viewedAt)")
                    .font(.caption)
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
    HistoryItemView(item: ViewedBrewery(breweryId: "1", name: "Brew Dog", streetAddress: "Kings Cross", viewedAt: .now))
        .padding()
}
