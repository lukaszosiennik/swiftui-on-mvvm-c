//
//  Created by Łukasz Osiennik on 28/07/2024.
//

public protocol RootCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype RootRouteIDManager: RootRouteIDManagerProtocol
    
    var routeIDManager: RootRouteIDManager { get }
}
