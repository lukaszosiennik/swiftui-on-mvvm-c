//
//  Created by Łukasz Osiennik on 05/08/2024.
//

extension Coordinating {

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

    func provideRootRouteIDManager<
        RouteIDManager: RootRouteIDManageable,
        RouteID: RootRouteID
    >() -> RouteIDManager? where RouteIDManager.RouteID == RouteID {
        var coordinator: (any Coordinating)? = self

        while coordinator?.parent != nil {
            coordinator = coordinator?.parent
        }

        return (coordinator as? (any RootCoordinating))?.routeIDManager as? RouteIDManager
    }
}
