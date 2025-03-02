//
//  ProgressStepsView.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-28.
//

import SwiftUI

struct ProgressStepsView: View {
    var body: some View {
        HStack() {
            ProgressItemView(currentItem: true)
            ProgressItemView(currentItem: false)
            ProgressItemView(currentItem: false)
        }
        .padding(.bottom, 10)
    }
}

struct ProgressItemView: View {
    private var currentItem: Bool

    init(currentItem: Bool) {
        self.currentItem = currentItem
    }
    
    var body: some View {
        Rectangle()
            .fill(currentItem ? .blue : .white)
            .frame(width: currentItem ? 10 : 25, height: 5)
            .cornerRadius(2)
    }
}

