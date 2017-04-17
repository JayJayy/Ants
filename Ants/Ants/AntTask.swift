//
// Created by Johannes Starke on 22.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public struct AntTask<TResult> {
    public let name: String?
    public let config: AntTaskConfig
    public let work: () throws -> TResult
    
    public init(name: String?, config: AntTaskConfig, work: @escaping () throws -> TResult) {
        self.name = name
        self.config = config
        self.work = work
    }
}
