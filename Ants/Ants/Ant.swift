//
// Created by Johannes Starke on 21.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public struct Ant {
    public func await<TResult>(result task: AntTask<TResult>) throws -> TResult {
        return try task.work()
    }
}
