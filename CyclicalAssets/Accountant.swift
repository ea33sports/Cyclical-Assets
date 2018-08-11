//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Eric Andersen on 7/10/18.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> Void
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gained(_ asset: Asset, completion: () -> Void) {
        netWorth += asset.value
        completion()
    }
    
    func lost(_ asset: Asset, completion: () -> Void) {
        netWorth -= asset.value
        completion()
    }
}
