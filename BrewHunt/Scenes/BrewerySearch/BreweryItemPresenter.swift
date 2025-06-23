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
    let address2: String?
    let address3: String?
    let city: String?
    let stateProvince: String?
    let postalCode: String?
    let country: String?
    let longitude: Double?
    let latitude: Double?
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
            address2: address2,
            address3: address3,
            city: city,
            stateProvince: stateProvince,
            postalCode: postalCode,
            country: country,
            longitude: longitude,
            latitude: latitude,
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
            address2: model.address2,
            address3: model.address3,
            city: model.city,
            stateProvince: model.stateProvince,
            postalCode: model.postalCode,
            country: model.country,
            longitude: model.longitude,
            latitude: model.latitude,
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
            address2: item.address2,
            address3: item.address3,
            city: item.city,
            stateProvince: item.stateProvince,
            postalCode: item.postalCode,
            country: item.country,
            longitude: item.longitude,
            latitude: item.latitude,
            phone: item.phone,
            websiteURL: item.websiteURL,
            state: item.state,
            street: item.street,
            timestamp: Date()
        )
    }
}
