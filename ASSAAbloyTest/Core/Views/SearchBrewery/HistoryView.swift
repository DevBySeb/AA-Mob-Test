//
//  Untitled.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-03-01.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Query(sort: \Brewery.name) var history: [Brewery]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("history".localized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom)

                ForEach(history, id: \.id) { result in
                    NavigationLink(destination: SearchDetailsView(brewery: result)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(result.name)
                                    .foregroundColor(.white)
                                Text(result.dateString ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom)
                            }
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                    }
                    Divider()
                        .background(Color.white)
                }
            }
            .padding()
        }
        .opacity(history.isEmpty ? 0 : 1)
    }
}
