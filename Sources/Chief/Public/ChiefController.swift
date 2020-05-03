//
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import UIKit

open class ChiefController: UIViewController {

    // MARK: -

    public typealias Transformer = (State) -> UIViewController?
    public var transform: Transformer?

    // MARK: -

    private lazy var animator: Animator = {
        Animator(root: self, transform: transform)
    }()

    // MARK: -

    public override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        animator.change(state, animated: false)
    }

    // MARK: -

    public var state: State {
        animator.state
    }

    public func change(_ state: State, animated: Bool = false) {
        animator.change(state, animated: animated)
    }

    // MARK: -

    open func transform(_ state: State) -> UIViewController {
        transform?(state) ?? vc(for: state)
    }

    private func vc(for state: State) -> UIViewController {
        switch state {
        case is LoadingState:
            return LoadingViewController()
        case is EmptyState:
            return EmptyViewController()
        case let state as ErrorState:
            return ErrorViewController(error: state.error, delegate: self as? ErrorViewController.Delegate)
        default:
            fatalError()
        }
    }

}
