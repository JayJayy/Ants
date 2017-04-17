//
// Created by Johannes Starke on 22.01.17.
// Copyright (c) 2017 Johannes Starke. All rights reserved.
//

import Foundation

public enum AntTaskConfig {
    case ui, background
}

internal extension AntTaskConfig {
    func queue() -> DispatchQueue {
        switch self {
        case .ui:
            return DispatchQueue.main
        case .background:
            return DispatchQueue(label: "de.johannesstarke.ants.background", qos: .background)
        }
    }
}
