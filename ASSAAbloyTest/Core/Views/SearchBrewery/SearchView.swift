//
//  SearchView.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-28.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        Text("search.title".localized)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
        
        TextField("", text: $searchText,
                  prompt: Text("search".localized).foregroundColor(.gray))
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .bold()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
                        .cornerRadius(8)
                        .padding(5)
    }
}
