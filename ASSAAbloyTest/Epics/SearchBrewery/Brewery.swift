//
//  Brewery.swift
//  ASSAAbloyTest
//
//  Created by Hripsime Martirosyan on 2025-02-28.
//

import Foundation
import RealmSwift

class Brewery: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var country: String?
    @Persisted var phone: String?
    @Persisted var address: String?
    @Persisted var city: String?
    @Persisted var state: String?
    @Persisted var street: String?
    @Persisted var dateString: String?

    convenience init(from model: BreweryInfo) {
        self.init()
        
        self.id = model.id
        self.name = model.name
        self.country = model.country
        self.phone = model.phone
        self.city = model.city
        self.address = model.address
        self.state = model.state
        self.street = model.street
    }
}
