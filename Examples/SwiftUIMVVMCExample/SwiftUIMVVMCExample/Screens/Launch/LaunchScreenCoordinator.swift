//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol LaunchScreenCoordinatorProtocol: CoordinatorProtocol {
    
    @discardableResult
    func goToRootRouteIDsScreen() -> Bool
}

final class LaunchScreenCoordinator: Coordinator, LaunchScreenCoordinatorProtocol {
    
    func goToRootRouteIDsScreen() -> Bool {
        goToRoot(routeID: AppRootRouteID.rootRouteIDs)
    }
}
