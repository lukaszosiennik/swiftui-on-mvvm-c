//
//  Created by Łukasz Osiennik on 28/07/2024.
//

public protocol RootCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype RootRouteManager: RootRouteManagerProtocol
    
    var routeManager: RootRouteManager { get }
}
