//
//  Service.swift
//  ChiefExample
//
//  Created by Damian Rzeszot on 03/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import Foundation

extension Sample {
    class Service {

        // MARK: -

        enum Error: Swift.Error {
            case monday
        }

        struct Response {
            struct Item {
                let value: String
            }
            let items: [Item]
        }

        // MARK: -

        func fetch(completion: @escaping (Result<Response, Error>) -> Void) {
            let responses: [Result<Response, Error>] = [
                .success(Response(items: [])),
                .success(Response(items: ["red", "blue", "orange", "green"])),
                .failure(.monday)
            ]

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion(responses.randomElement()!)
            }
        }

    }
}

extension Sample.Service.Response.Item: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.value = value
    }
}
