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
                    ForEach(viewModel.searchHistory) { presenter in
                        historyItemView(for: presenter)

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

    func dateString(from date: Date?) -> String {
        return DateFormatter.historyTimestampFormatter.string(from: date ?? Date())
    }

    func infoText(for presenter: BreweryItemPresenter) -> String {
        let components: [String?] = [
            presenter.name,
            presenter.city,
        ]
        return components.compactMap { $0 }.joined(separator: ", ")
    }

    func historyItemView(for presenter: BreweryItemPresenter) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 1.0) {
                Text(infoText(for: presenter))
                    .font(.poppinsRegular(size: 16.0))
                    .foregroundStyle(Color.bhPrimaryText)
                    .lineLimit(1)

                Text(dateString(from: presenter.timestamp))
                    .font(.poppinsRegular(size: 13))
                    .foregroundStyle(Color.bhTimestampText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Button {
                // TODO: 🔥 navigation to brewery details
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.bhPrimaryText)
            }
        }
    }
}
