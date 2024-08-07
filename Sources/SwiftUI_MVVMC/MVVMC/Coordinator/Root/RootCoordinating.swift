//
//  Created by Łukasz Osiennik on 28/07/2024.
//

public protocol RootCoordinating: Coordinating {

    associatedtype RootRouteIDManager: RootRouteIDManageable

    var routeIDManager: RootRouteIDManager { get }
}
