//
//  BreweryDetailView.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-22.
//

import SwiftUI

struct BreweryDetailView: View {
    @Environment(\.dismiss) private var dismiss

    let brewery: BreweryItemPresenter
    
    var body: some View {
        VStack(spacing: .zero) {
            headerSection
            
            ScrollView(showsIndicators: false) {
                contentSection
                    .padding(.bottom, 16.0)
            }
            .scrollBounceBehavior(.basedOnSize)
            
            bottomBackButton
                .padding(.bottom, 8.0)
        }
        .background(Color.bhBackground)
        .navigationBarHidden(true)
    }
}

// MARK: - Subviews

private extension BreweryDetailView {
    
    var headerSection: some View {
        VStack(spacing: .zero) {
            topBackButton
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18.0)
                .padding(.top, 13.0)

            Image(.sliderIndicator)
                .padding(.top, 46.0)
                .padding(.bottom, 36.0)

            breweryTitle
                .padding(.bottom, 62.0)
        }
    }

    var topBackButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 8.0) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18.0, weight: .semibold))
                    .foregroundStyle(Color.bhPrimaryText)
                
                Text("BACK")
                    .font(.poppinsRegular(size: 16.0))
                    .foregroundStyle(Color.bhPrimaryText)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    var bottomBackButton: some View {
        Button {
            dismiss()
        } label: {
            Text("Back")
                .font(.poppinsMedium(size: 16.0))
                .foregroundStyle(Color.bhPrimaryText)
                .frame(height: 44.0)
                .frame(maxWidth: .infinity)
        }
        .background(Color.bhButtonBlue)
        .cornerRadius(22.0)
        .padding(.horizontal, 18.0)
        .padding(.bottom, 18.0)
    }
    
    var breweryTitle: some View {
        Text(brewery.name)
            .font(.poppinsSemiBold(size: 24.0))
            .foregroundStyle(Color.bhPrimaryText)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 18.0)
    }
    
    var contentSection: some View {
        VStack(alignment: .leading, spacing: 58.0) {
            addressSection
            beveragesSection
        }
        .padding(.horizontal, 18.0)
    }
    
    var addressSection: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Address")
                .font(.poppinsBold(size: 16.0))
                .foregroundStyle(Color.bhPrimaryText)
            
            Text(formattedAddress)
                .font(.poppinsRegular(size: 16.0))
                .foregroundStyle(Color.bhPrimaryText)
        }
    }
    
    var beveragesSection: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Brewery Details")
                .font(.poppinsBold(size: 16.0))
                .foregroundStyle(Color.bhPrimaryText)
            
            VStack(spacing: 6.0) {
                ForEach(breweryDetails, id: \.key) { detail in
                    breweryDetailRow(detail)
                }
            }
        }
    }
    
    func breweryDetailRow(_ detail: BreweryDetail) -> some View {
        HStack {
            Text(detail.key)
                .font(.poppinsSemiBold(size: 14.0))
                .foregroundStyle(Color.bhPrimaryText)

            Text(detail.value)
                .font(.poppinsBold(size: 14.0))
                .foregroundStyle(Color.bhPrimaryText)
                .opacity(0.6)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.vertical, 8.0)
        .background(Color.clear)
        .overlay(
            Rectangle()
                .frame(height: 1.0)
                .foregroundStyle(Color.bhSecondaryBackground)
                .padding(.top, 32.0),
            alignment: .bottom
        )
    }
}

// MARK: - Computed Properties

private extension BreweryDetailView {
    
    var formattedAddress: String {
        let addressComponents = [
            brewery.street,
            brewery.address1,
            brewery.city,
            brewery.state
        ].compactMap { $0?.isEmpty == false ? $0 : nil }
        
        return addressComponents.joined(separator: ", ")
    }
    
    var breweryDetails: [BreweryDetail] {
        var details: [BreweryDetail] = []
        details.append(BreweryDetail(key: "Brewery Type", value: brewery.breweryType.rawValue.capitalized))

        if !formattedAddress.isEmpty {
            details.append(BreweryDetail(key: "Address", value: formattedAddress))
        }

        if !brewery.state.isEmpty {
            details.append(BreweryDetail(key: "State", value: brewery.state))
        }

        if let country = brewery.country, !country.isEmpty {
            details.append(BreweryDetail(key: "Country", value: country))
        }

        if let phone = brewery.phone, !phone.isEmpty {
            details.append(BreweryDetail(key: "Phone", value: phone))
        }

        if let website = brewery.websiteURL, !website.isEmpty {
            details.append(BreweryDetail(key: "Website", value: website))
        }
        
        return details
    }
}

// MARK: - Supporting Types

private struct BreweryDetail {
    let key: String
    let value: String
}
