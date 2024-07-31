//
//  Created by Łukasz Osiennik on 22/06/2024.
//

import SwiftUI_MVVMC

protocol RootRouteIDsScreenCoordinatorProtocol: CoordinatorProtocol {
    
    @discardableResult
    func goToRoot(routeID: AppRootRouteID) -> Bool
}

final class RootRouteIDsScreenCoordinator: Coordinator, RootRouteIDsScreenCoordinatorProtocol {}
