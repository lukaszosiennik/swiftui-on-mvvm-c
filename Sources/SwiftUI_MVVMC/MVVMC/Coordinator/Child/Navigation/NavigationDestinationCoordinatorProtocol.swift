//
//  Created by Łukasz Osiennik on 01/08/2024.
//

import SwiftUI

public protocol NavigationDestinationCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype RouteID: NavigationRouteID
    
    @discardableResult
    func addToPath(routeID: RouteID) -> Bool
    
    @discardableResult
    func removeFromPath(segmentCount: Int) -> Bool
    
    @discardableResult
    func clearPath() -> Bool
}

extension NavigationDestinationCoordinatorProtocol {
    
    public func addToPath(routeID: RouteID) -> Bool {
        guard let pathBinding = providePathBinding() else {
            return false
        }
        
        pathBinding.wrappedValue.append(routeID)
        
        return true
    }
    
    public func removeFromPath(segmentCount: Int) -> Bool {
        guard let pathBinding = providePathBinding() else {
            return false
        }
        
        pathBinding.wrappedValue.removeLast(segmentCount)
        
        return true
    }
    
    public func clearPath() -> Bool {
        guard let pathBinding = providePathBinding() else {
            return false
        }
        
        pathBinding.wrappedValue = .init()
        
        return true
    }
    
    func providePathBinding() -> Binding<NavigationPath>? {
        var coordinator: (any CoordinatorProtocol)? = self
        
        while (coordinator != nil && !(coordinator is (any NavigationStackCoordinatorProtocol))) {
            coordinator = coordinator?.parent
        }
        
        guard let pathBinding = (coordinator as? (any NavigationStackCoordinatorProtocol))?.pathBinding else {
            return nil
        }
        
        return pathBinding
    }
}

