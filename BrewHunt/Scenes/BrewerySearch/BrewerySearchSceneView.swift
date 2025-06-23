//
//  BrewerySearchSceneView.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-19.
//

import SwiftUI

struct BrewerySearchSceneView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = BrewerySearchViewModel()

    var body: some View {
        VStack(spacing: .zero) {
            Image(.magnifierIcon)
                .padding(.bottom, 26.0)

            Image(.sliderIndicator)
                .padding(.bottom, 35.0)

            Text("Search for a brewery")
                .font(.poppinsSemiBold(size: 24.0))
                .foregroundStyle(Color.bhPrimaryText)
                .multilineTextAlignment(.center)
                .padding(.bottom, 43.0)

            BrewerySearchBar(
                searchText: $viewModel.searchText,
                placeholder: "Search..."
            )
            .padding(.horizontal, 16.0)

            // Dynamic content based on state
            dynamicContentView
                .padding(.top, 12.0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 82.0)
        .background(Color.bhBackground)
        .dismissKeyboardOnTap()
        .onAppear {
            viewModel.setModelContext(modelContext)
        }
    }
}

// MARK: - Subviews

private extension BrewerySearchSceneView {

    @ViewBuilder
    private var dynamicContentView: some View {
        switch viewModel.state {
        case .empty:
            EmptyView()
        case .loading:
            loadingView
        case .success:
            BrewerySearchResultsView(viewModel: viewModel)
        case .error(let message):
            errorView(message: message)
        case .history:
            BreweryHistoryView(viewModel: viewModel)
        }
    }

    private var loadingView: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .bhPrimaryText))
            .scaleEffect(1.5)
            .padding(.top, 32.0)
    }

    private func errorView(message: String) -> some View {
        VStack(spacing: 8.0) {
            Image(systemName: "exclamationmark.triangle")
                .font(.poppinsBold(size: 44.0))
                .foregroundStyle(Color.bhPrimaryText)

            Text("Error")
                .font(.poppinsSemiBold(size: 18))
                .foregroundStyle(Color.bhPrimaryText)

            Text(message)
                .font(.poppinsRegular(size: 14))
                .foregroundStyle(Color.bhSecondaryText)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16.0)
        }
        .padding(.top, 32)
    }
}

#Preview {
    BrewerySearchSceneView()
}
