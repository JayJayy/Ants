//
// Created by Johannes Starke on 22.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public class AntQueen {
    internal var ant: Ant?
    
    public init() {
        
    }
    
    public func cancel() {
        ant?.cancelled = true
    }
}
