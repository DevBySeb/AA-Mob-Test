//
//  BrewerySearchBar.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-19.
//

import SwiftUI

struct BrewerySearchBar: View {
    @Binding var searchText: String
    let placeholder: String

    @FocusState private var isSearchFieldFocused: Bool

    init(
        searchText: Binding<String>,
        placeholder: String = "Search..."
    ) {
        self._searchText = searchText
        self.placeholder = placeholder
    }

    var body: some View {
        TextField(
            "",
            text: $searchText,
            prompt: Text(placeholder).foregroundStyle(Color.bhSecondaryText)
        )
        .font(.poppinsSemiBold(size: 16))
        .foregroundStyle(Color.bhPrimaryText)
        .focused($isSearchFieldFocused)
        .submitLabel(.search)
        .padding(.horizontal, 16.0)
        .frame(height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.bhBorder, lineWidth: 1)
        )
        .onTapGesture {
            isSearchFieldFocused = true
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        BrewerySearchBar(searchText: .constant(""))
        BrewerySearchBar(searchText: .constant("Fun brewery"))
    }
    .padding()
    .background(Color.bhBackground)
}
