//
//  SearchDetailsView.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-28.
//

import SwiftUI

struct SearchDetailsView: View {
    let brewery: Brewery
        
    var body: some View {
        VStack {
            ProgressStepsView()
                .padding(.top, 40)
            
            Text(brewery.address ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading) {
                Text("address".localized)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Divider()
                Text((brewery.address ?? "") + ", " + (brewery.city ?? ""))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("brewery.details".localized)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                DetailItemView(itemName: "name".localized, itemValue: brewery.name)
                DetailItemView(itemName: "phone".localized, itemValue: brewery.phone ?? "")
                DetailItemView(itemName: "state".localized, itemValue: brewery.state ?? "")
            }
            .background(Color.black.opacity(0.2))
            .padding(.horizontal)
            
            Spacer()
            BackButton()
        }
        .background(Color.black.ignoresSafeArea())
    }
}

struct DetailItemView: View {
    private let itemName: String
    private let itemValue: String
    
    init(itemName: String, itemValue: String) {
        self.itemName = itemName
        self.itemValue = itemValue
    }
    var body: some View {
        HStack {
            Text(itemName)
                .foregroundColor(.white)
            Spacer()
            Text(itemValue)
                .foregroundColor(.white)
                .padding(.vertical, 5)
            
        }
        Divider()
            .background(Color.white)
    }
}

struct BackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: {
            dismiss()
        }) {
            Text("back".localized)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(25)
        }
    }
}
