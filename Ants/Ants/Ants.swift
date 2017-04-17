//
// Created by Johannes Starke on 21.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public struct Ants {
    private static let shared: Ants = Ants()
    
    public static func async(_ block: @escaping (_ ant: Ant) -> ()) -> AntQueen {
        let ant = Ant()
        let antQueen = AntQueen()
        
        antQueen.ant = ant
        
        shared.workQueue.async {
            block(ant)
        }
        
        return antQueen
    }
    
    private let workQueue: DispatchQueue
    
    private init() {
        workQueue = DispatchQueue(label: "de.johannesstarke.workQueue")
    }
}