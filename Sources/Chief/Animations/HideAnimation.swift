//
//  HideAnimation.swift
//  
//
//  Created by Damian Rzeszot on 03/05/2020.
//

import UIKit

struct HideAnimation {

    // MARK: -

    let child: UIViewController

    // MARK: -

    func run(animated: Bool, completion: @escaping () -> Void) {
        child.willMove(toParent: nil)

        UIView.animate(withDuration: animated ? 0.2 : 0, animations: {
            self.child.view.alpha = 0
        }, completion: { _ in
            self.child.view.removeFromSuperview()
            self.child.removeFromParent()

            completion()
        })
    }

}
