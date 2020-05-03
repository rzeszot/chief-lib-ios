//
//  Copyright © 2020 Damian Rzeszot. All rights reserved.
//

public struct ErrorState: State {
    public let error: Error?

    public init(error: Error? = nil) {
        self.error = error
    }
}
