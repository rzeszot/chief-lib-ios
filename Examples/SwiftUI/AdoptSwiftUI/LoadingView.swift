//
//  ErrorView.swift
//  AdoptSwiftUI
//
//  Created by Damian Rzeszot on 02/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        Loader()
    }

    struct Loader: UIViewRepresentable {
        func makeUIView(context: Context) -> UIActivityIndicatorView {
            UIActivityIndicatorView(style: .medium)
        }

        func updateUIView(_ view: UIActivityIndicatorView, context: Context) {
            view.startAnimating()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
