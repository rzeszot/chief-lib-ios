//
//  File.swift
//  
//
//  Created by Damian Rzeszot on 03/05/2020.
//

import UIKit

struct ShowAnimation {

    // MARK: -

    let root: UIViewController
    let child: UIViewController

    // MARK: -

    func run(animated: Bool, completion: @escaping () -> Void) {
        root.addChild(child)

        root.view.addSubview(child.view)

        child.view.translatesAutoresizingMaskIntoConstraints = false

        child.view.leftAnchor.constraint(equalTo: root.view.leftAnchor).isActive = true
        child.view.rightAnchor.constraint(equalTo: root.view.rightAnchor).isActive = true
        child.view.topAnchor.constraint(equalTo: root.view.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: root.view.bottomAnchor).isActive = true

        child.view.alpha = 0

        UIView.animate(withDuration: animated ? 0.2 : 0, animations: {
            self.child.view.alpha = 1
        }, completion: { _ in
            self.child.didMove(toParent: self.root)
            completion()
        })
    }

}
