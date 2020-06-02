//
//  Sample.ContainerController.swift
//  ChiefExample
//
//  Created by Damian Rzeszot on 03/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import Chief
import UIKit

extension Sample {
    class ContainerController: ChiefController, Coordinator.Delegate, ErrorViewController.Delegate {

        // MARK: -

        var coordinator: Coordinator!

        // MARK: - View Lifecycle

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            coordinator.appearing()
        }

        // MARK: - Coordinator.Delegate

        func coordinatorDidChangeState(_ coordinator: Sample.Coordinator) {
            change(coordinator.state, animated: true)
        }

        // MARK: - ErrorViewController.Delegate

        func errorViewControllerDidTapRetry(_ vc: ErrorViewController) {
            coordinator.appearing()
        }

        func errorViewController(_ vc: ErrorViewController, messageFor error: Error) -> String? {
            nil
        }

    }
}
