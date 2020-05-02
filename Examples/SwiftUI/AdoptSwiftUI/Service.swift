//
//  Service.swift
//  AdoptSwiftUI
//
//  Created by Damian Rzeszot on 03/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import SwiftUI

enum Model {
    struct Item: Identifiable {
        let id: UUID = .init()
        let value: String
    }

    case loading
    case empty
    case data([Item])
    case failure(error: Error?)

    static var data: Model {
        .data([
            Item(value: "pharetra sit amet aliquam id"),
            Item(value: "sed enim ut sem viverra"),
            Item(value: "sapien eget mi proin sed"),
            Item(value: "dignissim suspendisse in est ante"),
            Item(value: "tempus iaculis urna id volutpat"),
            Item(value: "iaculis eu non diam phasellus")
        ])
    }
}

class Service: ObservableObject {

    @Published
    var model: Model = .loading

    func appearing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.model = .failure(error: nil)
        }
    }

    func reload() {
        model = .loading

        let result: [Model] = [
            .empty,
            .failure(error: nil),
            .data
        ]

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.model = result.randomElement()!
        }
    }
}
