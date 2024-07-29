//
//  Created by Łukasz Osiennik on 28/07/2024.
//

public protocol RootCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype RootRouteManagerType: RootRouteManagerProtocol
    
    var routeManager: RootRouteManagerType { get }
}
