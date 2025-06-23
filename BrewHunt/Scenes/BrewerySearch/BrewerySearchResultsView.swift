//
//  BrewerySearchResultsView.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-22.
//

import SwiftUI

struct BrewerySearchResultsView: View {
    let viewModel: BrewerySearchViewModel

    var body: some View {
        VStack(spacing: .zero) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28.0) {
                    ForEach(viewModel.displayedBreweries) { brewery in
                        resultItemButton(for: brewery)
                    }
                }
                .padding(.top, 20.0)
                .padding(.bottom, viewModel.hasMoreResults ? 0 : 20.0)
            }
            .scrollBounceBehavior(.basedOnSize)
            
            if viewModel.hasMoreResults {
                showMoreButton
            }
        }
        .fixedSize(horizontal: false, vertical: !viewModel.showAllResults)
        .background(Color.bhSecondaryBackground)
        .cornerRadius(6.0)
        .padding(.horizontal, 16.0)
    }
}

// MARK: - SubViews

private extension BrewerySearchResultsView {
    
    var showMoreButton: some View {
        Button {
            viewModel.toggleShowMore()
        } label: {
            Text(viewModel.showAllResults ? "Show less" : "Show more")
                .font(.poppinsMedium(size: 16))
                .foregroundStyle(Color.bhBorder)
                .frame(height: 44.0)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 16)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 22.0)
                .stroke(Color.bhBorder, lineWidth: 1.0)
        )
        .padding(.horizontal, 16.0)
        .padding(.top, 12.0)
        .padding(.bottom, 10.0)
    }
    
    func resultItemButton(for brewery: BreweryItemPresenter) -> some View {
        Button {
            viewModel.saveBrewery(brewery)
            // TODO: 🔥 Navigate to brewery details
        } label: {
            Text(brewery.name)
                .font(.poppinsSemiBold(size: 16.0))
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.bhPrimaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12.0)
        }
    }
}
