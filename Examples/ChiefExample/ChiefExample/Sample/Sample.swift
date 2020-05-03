//
//  Sample.swift
//  ChiefExample
//
//  Created by Damian Rzeszot on 03/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import Chief
import UIKit

enum Sample {
    static func build() -> UIViewController {
        let coordinator = Coordinator()
        let vc = ContainerController()

        coordinator.delegate = vc

        vc.coordinator = coordinator
        vc.transform = { state in
            switch state {
            case let state as DataState<Model>:
                let vc = DataViewController()
                vc.model = state.data
                return vc
            default:
                return nil
            }
        }

        return vc
    }
}
