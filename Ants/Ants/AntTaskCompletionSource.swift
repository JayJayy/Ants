//
// Created by Johannes Starke on 17.04.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public class AntTaskCompletionSource<TResult> {
    public private(set) var task: AntTask<TResult>
    
    private let sema: DispatchSemaphore
    
    private var result: TResult?
    private var error: Error?
    
    public init() {
        sema = DispatchSemaphore(value: 0)
        task = AntTask<TResult>(name: nil, config: .background, work: { throw AntError.emptyResult })
        
        task = AntTask<TResult>(name: nil, config: .background, work: { [weak self] in
            self?.sema.wait()
            
            if let result = self?.result {
                return result
            } else if let error = self?.error {
                throw error
            } else {
                throw AntError.emptyResult
            }
        })
        
    }
    
    public func set(result: TResult) {
        self.result = result
        
        sema.signal()
    }
    
    public func set(error: Error) {
        self.error = error
        
        sema.signal()
    }
}