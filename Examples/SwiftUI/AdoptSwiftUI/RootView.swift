//
//  RootView.swift
//  AdoptSwiftUI
//
//  Created by Damian Rzeszot on 02/05/2020.
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

import SwiftUI

struct RootView: View {

    @ObservedObject
    var service: Service = .init()

    var body: some View {
        VStack {
            subview(for: service.model)
        }
        .onAppear(perform: service.appearing)
    }

    // MARK: -

    func subview(for model: Model) -> some View {
        switch model {
        case .empty:
            return AnyView(EmptyView(refresh: service.reload))
        case .failure(let error):
            return AnyView(ErrorView(error: error, reload: service.reload))
        case .loading:
            return AnyView(LoadingView())
        case .data(let items):
            return AnyView(DataView(items: items))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
