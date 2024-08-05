//
//  Created by Łukasz Osiennik on 01/08/2024.
//

import SwiftUI

public protocol NavigationPathCoordinating: Coordinating {
    
    associatedtype RouteID: NavigationRouteID
    
    @discardableResult
    func navigationPathAppend(_ routeID: RouteID) -> Bool
    
    @discardableResult
    func navigationPathRemoveLast(_ segmentCount: Int) -> Bool
    
    @discardableResult
    func navigationPathClear() -> Bool
}

extension NavigationPathCoordinating {
    
    public func navigationPathAppend(_ routeID: RouteID) -> Bool {
        guard let pathBinding = navigationPathBinding() else {
            return false
        }
        
        pathBinding.wrappedValue.append(routeID)
        
        return true
    }
    
    public func navigationPathRemoveLast(_ segmentCount: Int) -> Bool {
        guard let pathBinding = navigationPathBinding(), !pathBinding.wrappedValue.isEmpty else {
            return false
        }
        
        pathBinding.wrappedValue.removeLast(segmentCount)
        
        return true
    }
    
    public func navigationPathClear() -> Bool {
        guard let pathBinding = navigationPathBinding() else {
            return false
        }
        
        pathBinding.wrappedValue = .init()
        
        return true
    }
    
    func navigationPathBinding() -> Binding<NavigationPath>? {
        var coordinator: (any Coordinating)? = self
        
        while (coordinator != nil && !(coordinator is (any NavigationStackCoordinating))) {
            coordinator = coordinator?.parent
        }
        
        guard let pathBinding = (coordinator as? (any NavigationStackCoordinating))?.pathBinding else {
            return nil
        }
        
        return pathBinding
    }
}

