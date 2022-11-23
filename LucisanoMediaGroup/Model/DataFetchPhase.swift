//
//  DataFetchPhase.swift
//  LucisanoMediaGroup
//
//  Created by Alexey on 22/11/22.
//

import Foundation

enum DataFetchPhase<V> {
    
    case empty
    case success(V)
    case failure(Error)
    
    var value: V? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
    
}

