//
// Created by Johannes Starke on 22.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public class AntQueen {
    internal var ant: Ant?
    
    internal let exclusive: Bool
    internal let cancelOld: Bool
    
    public convenience init() {
        self.init(exclusive: false, cancel: false)
    }
    
    public init(exclusive: Bool, cancel: Bool) {
        self.exclusive = exclusive
        self.cancelOld = cancel
    }
    
    public func cancel() {
        ant?.cancelled = true
    }
}
