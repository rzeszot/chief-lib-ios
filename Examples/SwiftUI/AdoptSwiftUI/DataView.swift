//
//  DataView.swift
//  AdoptSwiftUI
//
//  Created by Damian Rzeszot on 02/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import SwiftUI

struct DataView: View {

    var items: [Model.Item]

    var body: some View {
        List(items) { item in
            VStack {
                Text(item.value)
            }
        }
    }

}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(items: [
            Model.Item(value: "aaa"),
            Model.Item(value: "bbb"),
            Model.Item(value: "ccc"),
            Model.Item(value: "ddd")
        ])
    }
}
