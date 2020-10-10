//
//  Contact.swift
//  Phone-Contact-App
//
//  Created by IOS on 10/10/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Contact {
    let name : String
    let dob : String
    let email : String
    let cell : String
    let country : String
    
    init(name: String, dob: String, email: String, cell: String, country: String) {
        self.name = name
        self.dob = dob
        self.email = email
        self.cell = cell
        self.country = country
    }
}

struct ContactData: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let name: Name
    let dob: Dob
    let email: String
    let cell: String
    let location: Location
}

struct Name: Decodable {
    let first: String
    let last: String
}

struct Dob: Decodable {
    let date: String
}

struct Location: Decodable {
    let country: String
}
