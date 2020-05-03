//
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

public struct DataState<T>: State {
    public let data: T

    public init(data: T) {
        self.data = data
    }
}
