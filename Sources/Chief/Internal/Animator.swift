//
//  Animator.swift
//  
//
//  Created by Damian Rzeszot on 03/05/2020.
//

import UIKit

class Animator {

    unowned let root: UIViewController
    let transform: (State) -> UIViewController

    init(root: UIViewController, transform: @escaping (State) -> UIViewController) {
        self.root = root
        self.transform = transform
    }

    // MARK: -

    public func change(_ state: State, animated: Bool = false) {
        queue.append((state: state, animated: animated))
        run()
    }

    private var running: Bool = false
    private var queue: [(state: State, animated: Bool)] = []

    private func run() {
        guard !running && !queue.isEmpty else { return }

        running = true
        let (state, animated) = queue.removeFirst()

        let new = transform(state)

        if let old = root.children.first {
            let animation = HideAnimation(child: old)
            animation.run(animated: animated) {
                let animation = ShowAnimation(root: self.root, child: new)

                animation.run(animated: animated) {
                    self.running = false
                    self.run()
                }
            }
        } else {
            let animation = ShowAnimation(root: root, child: new)

            animation.run(animated: animated) {
                self.running = false
                self.run()
            }
        }
    }

}
