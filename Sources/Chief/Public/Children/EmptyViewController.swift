//
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import UIKit

public class EmptyViewController: UIViewController {

    // MARK: - Outlets

    var titleLabel: UILabel!
    var imageView: UIImageView!

    // MARK: -

    public override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground

        let contentView = UIView()
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        imageView = UIImageView(image: UIImage(systemName: "tray"))
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .scaleAspectFit

        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true

        titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .callout)
        titleLabel.textColor = .secondaryLabel
        titleLabel.text = "Nothing to show"
        titleLabel.textAlignment = .center

        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
    }

}
