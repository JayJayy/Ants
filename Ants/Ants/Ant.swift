//
// Created by Johannes Starke on 21.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public struct Ant {
    public func await<TResult>(result task: AntTask<TResult>) throws -> TResult {
        let queue = task.config.queue()
        let sema = DispatchSemaphore(value: 0)
        
        var result: TResult?
        var error: Error?
        
        queue.async {
            do {
                result = try task.work()
            } catch let e {
                error = e
            }
            
            sema.signal()
        }
    
        sema.wait()
        
        if let result = result {
            return result
        } else if let error = error {
            throw error
        } else {
            throw AntError.emptyResult
        }
    }
    
    internal init() {
        
    }
}
