//
//  ResultListView.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-28.
//

import SwiftUI

struct ResultListView: View {
    private var showMoreButtonClicked: () -> Void
    private var onBrewerySelected: (Brewery) -> Void
    private var showMore: Bool
    
    private let list: [Brewery]
    
    init(list: [Brewery],
         showMore: Bool,
         showMoreButtonClicked: @escaping () -> Void,
         onBrewerySelected: @escaping (Brewery) -> Void) {
        self.list = list
        self.showMore = showMore
        self.showMoreButtonClicked = showMoreButtonClicked
        self.onBrewerySelected = onBrewerySelected
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                ForEach(list, id: \.self) { result in
                    NavigationLink(destination: SearchDetailsView(brewery: result)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(result.name)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        onBrewerySelected(result)
                    })
                }
                if showMore {
                    Button(action: {
                        self.showMoreButtonClicked()
                    }) {
                        Text("show.more".localized)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
                    }
                    .padding(.horizontal, 5)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.2)))
            .padding(.horizontal, 5)
        }
    }
}


