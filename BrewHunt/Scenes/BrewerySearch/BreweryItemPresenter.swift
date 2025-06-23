//
//  BreweryItemPresenter.swift
//  BrewHunt
//
//  Created by Samet Berberoğlu on 2025-06-23.
//

import Foundation

struct BreweryItemPresenter: Identifiable {
    let id: String
    let name: String
    let breweryType: BreweryType
    let address1: String?
    let city: String?
    let country: String?
    let phone: String?
    let websiteURL: String?
    let state: String
    let street: String?
    let timestamp: Date?
}

extension BreweryItemPresenter {

    func toBreweryHistoryItemModel() -> BreweryHistoryItemModel {
        return BreweryHistoryItemModel(
            id: id,
            timestamp: timestamp ?? Date(),
            breweryItem: toBreweryItem()
        )
    }

    func toBreweryItem() -> BreweryItem {
        return BreweryItem(
            id: id,
            name: name,
            breweryType: breweryType,
            address1: address1,
            city: city,
            country: country,
            phone: phone,
            websiteURL: websiteURL,
            state: state,
            street: street
        )
    }

    static func fromHistoryItemModel(_ model: BreweryHistoryItemModel) -> BreweryItemPresenter {
        return BreweryItemPresenter(
            id: model.id,
            name: model.name,
            breweryType: BreweryType(rawValue: model.breweryType) ?? .other,
            address1: model.address1,
            city: model.city,
            country: model.country,
            phone: model.phone,
            websiteURL: model.websiteURL,
            state: model.state,
            street: model.street,
            timestamp: model.timestamp
        )
    }

    static func fromBreweryItem(_ item: BreweryItem) -> BreweryItemPresenter {
        return BreweryItemPresenter(
            id: item.id,
            name: item.name,
            breweryType: item.breweryType,
            address1: item.address1,
            city: item.city,
            country: item.country,
            phone: item.phone,
            websiteURL: item.websiteURL,
            state: item.state,
            street: item.street,
            timestamp: Date()
        )
    }
}
