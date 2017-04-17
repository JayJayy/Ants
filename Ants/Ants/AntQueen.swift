//
// Created by Johannes Starke on 22.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public class AntQueen {
    internal var ant: Ant?
    
    internal let exclusiv: Bool
    internal let cancelOld: Bool
    
    public convenience init() {
        self.init(exclusiv: false, cancel: false)
    }
    
    public init(exclusiv: Bool, cancel: Bool) {
        self.exclusiv = exclusiv
        self.cancelOld = cancel
    }
    
    public func cancel() {
        ant?.cancelled = true
    }
}
