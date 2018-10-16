//
//  Response.swift
//  Practice_Ques_Ans
//
//  Created by Sebastin on 10/15/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

struct Response: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited, url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

// MARK: Convenience initializers

extension Response {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Response.self, from: data) else { return nil }
        self = me
    }

    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }

    init?(fromURL url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }

    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }

    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
