//
//  ErrorView.swift
//  AdoptSwiftUI
//
//  Created by Damian Rzeszot on 02/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    var error: Error?
    var reload: () -> Void

    var body: some View {
        VStack {
            Spacer()

            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)

            Text("Something went wrong")
                .padding(.vertical, 10)

            if error != nil {
                Text(error!.localizedDescription)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button(action: reload) {
                Text("Retry")
                    .padding(20)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "This is message"]),
                  reload: {})
    }
}
