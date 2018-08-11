//
//  Person.swift
//  CyclicalAssets
//
//  Created by Eric Andersen on 7/10/18.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person \(name)"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in
            
            self?.netWorthDidChange(to: netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnership(of asset: Asset) {
//        asset.owner = self
//        assets.append(asset)
        if asset.owner == nil {
            accountant.gained(asset, completion: {
                asset.owner = self
                assets.append(asset)
                asset.assetIndex = assets.endIndex - 1
            })
        } else {
            print("Item is already owned by \(asset.owner?.name). Remove ownership before you reassign.")
        }
    }
    
    func removeOwnership(of asset: Asset) {
        accountant.lost(asset, completion: {
            asset.owner = nil
            assets.remove(at: asset.assetIndex)
        })
    }
    
    func netWorthDidChange(to netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
    
    func useNetWorthChangedHandler(handler: @escaping (Double) -> Void) {
        accountant.netWorthChangedHandler = handler
    }
}
