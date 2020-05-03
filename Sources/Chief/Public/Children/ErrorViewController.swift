//
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import UIKit

public protocol ErrorViewControllerDelegate: class {
    func errorViewControllerDidTapRetry(_ vc: ErrorViewController)
}

public class ErrorViewController: UIViewController {

    // MARK: -

    public typealias Delegate = ErrorViewControllerDelegate

    weak var delegate: Delegate?

    // MARK: -

    private var error: Error?

    public convenience init(error: Error?, delegate: ErrorViewControllerDelegate? = nil) {
        self.init()

        self.error = error
        self.delegate = delegate
    }

    // MARK: -

    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var imageView: UIImageView!
    var retryButton: UIButton!

    // MARK: -

    @objc
    func retryAction() {
        delegate?.errorViewControllerDidTapRetry(self)
    }

    // MARK: -

    public override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground

        titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.text = "Something went wrong"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0

        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        subtitleLabel = UILabel()
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.text = error?.localizedDescription
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.numberOfLines = 0

        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true

        imageView = UIImageView(image: UIImage(systemName: "exclamationmark.triangle.fill"))
        imageView.tintColor = UIColor.systemYellow
        imageView.contentMode = .scaleAspectFit

        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        retryButton = UIButton(type: .custom)
        retryButton.setTitle("Retry", for: .normal)
        retryButton.addTarget(self, action: #selector(retryAction), for: .touchUpInside)

        view.addSubview(retryButton)
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        retryButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        retryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
    }

}
