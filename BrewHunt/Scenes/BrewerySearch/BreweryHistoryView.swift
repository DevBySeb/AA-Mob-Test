//
//  BreweryHistoryView.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-22.
//

import SwiftUI

struct BreweryHistoryView: View {
    let viewModel: BrewerySearchViewModel

    var body: some View {

        VStack {
            Text("History")
                .font(.poppinsBold(size: 16.0))
                .foregroundStyle(Color.bhPrimaryText)
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12.0) {
                    ForEach(viewModel.searchHistory) { brewery in
                        historyItemView(for: brewery)

                        Divider()
                            .background(Color.bhSecondaryBackground)
                    }
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .padding(.top, 4.0)
        }
        .padding(.top, 29.0)
        .padding(.horizontal, 16.0)
    }
}

// MARK: - SubViews

private extension BreweryHistoryView {

    func historyItemView(for brewery: BreweryItemPresenter) -> some View {
        NavigationLink(destination: BreweryDetailView(brewery: brewery)) {
            HStack {
                VStack(alignment: .leading, spacing: 1.0) {
                    Text(infoText(for: brewery))
                        .font(.poppinsRegular(size: 16.0))
                        .foregroundStyle(Color.bhPrimaryText)
                        .lineLimit(1)

                    Text(formattedDate)
                        .font(.poppinsRegular(size: 13))
                        .foregroundStyle(Color.bhTimestampText)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.bhPrimaryText)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: Date())
    }

    func infoText(for brewery: BreweryItemPresenter) -> String {
        let components: [String?] = [
            brewery.name,
            brewery.city,
        ]
        return components.compactMap { $0 }.joined(separator: ", ")
    }
}
