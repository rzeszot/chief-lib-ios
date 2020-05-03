//
//  SampleCoordinator.swift
//  ChiefExample
//
//  Created by Damian Rzeszot on 03/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import Chief
import UIKit

protocol SampleCoordinatorDelegate: class {
    func coordinatorDidChangeState(_ coordinator: Sample.Coordinator)
}

extension Sample {
    class Coordinator {

        // MARK: -

        typealias Delegate = SampleCoordinatorDelegate
        weak var delegate: SampleCoordinatorDelegate?

        // MARK: -

        var state: State
        {
            didSet {
                delegate?.coordinatorDidChangeState(self)
            }
        }

        // MARK: -

        private let service = Service()

        init(service: Service = .init()) {
            state = EmptyState()
        }

        // MARK: -

        func appearing() {
            state = LoadingState()

            service.fetch { result in
                switch result {
                case .success(let response):
                    if response.items.isEmpty {
                        self.state = EmptyState()
                    } else {
                        self.state = DataState(response: response)
                    }
                case .failure(let error):
                    self.state = ErrorState(error: error)
                }
            }
        }

    }
}

extension DataState where T == Sample.Model {
    init(response: Sample.Service.Response) {
        let items = response
            .items
            .map { Sample.Model.Item(value: $0.value) }

        self.init(data: Sample.Model(items: items))
    }
}
