//
//  DataViewController.swift
//  ChiefExample
//
//  Created by Damian Rzeszot on 03/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import UIKit

extension Sample {
    class DataViewController: UIViewController, UITableViewDataSource {

        // MARK: -

        var model: Model!

        // MARK: - Outlets

        var tableView: UITableView!

        // MARK: - View Lifecycle

        override func loadView() {
            tableView = UITableView()
            tableView.dataSource = self

            view = tableView
        }

        // MARK: - UITableViewDataSource

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            model.items.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                        ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = model.items[indexPath.row].value
            return cell
        }

    }
}
