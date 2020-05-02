//
//  EmptyView.swift
//  AdoptSwiftUI
//
//  Created by Damian Rzeszot on 02/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import SwiftUI

struct EmptyView: View {
    var refresh: () -> Void

    var body: some View {
        VStack {
            Spacer()

            Text("Nothing to show")

            Text("Maybe another time...")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.top, 10)

            Spacer()

            Button(action: refresh) {
                Text("Retry")
                    .padding(20)
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(refresh: {})
    }
}
