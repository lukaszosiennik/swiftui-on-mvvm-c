//
//  Created by Łukasz Osiennik on 28/07/2024.
//

extension Coordinator {
    
    @discardableResult
    public func goToRoot<RouteID: RootRouteID>(
        routeID: RouteID
    ) -> Bool {
        guard let rootRouteIDManager: RootRouteIDManager<RouteID> = provideRootRouteIDManager() else {
            return false
        }
        
        rootRouteIDManager.currentRouteID = routeID
        
        return true
    }
    
    func provideRootRouteIDManager<RouteID: RootRouteID>() -> RootRouteIDManager<RouteID>? {
        var coordinator: Coordinator? = self
        
        while (coordinator?.parent != nil) {
            coordinator = coordinator?.parent
        }
        
        return (coordinator as? RootCoordinator)?.routeIDManager
    }
}
