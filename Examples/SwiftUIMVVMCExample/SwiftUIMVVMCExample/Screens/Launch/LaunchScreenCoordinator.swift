//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol LaunchScreenCoordinating: Coordinating {
    
    @discardableResult
    func goToRootRouteIDsScreen() -> Bool
}

final class LaunchScreenCoordinator: Coordinator, LaunchScreenCoordinating {
    
    func goToRootRouteIDsScreen() -> Bool {
        goToRoot(routeID: AppRootRouteID.rootRouteIDs)
    }
}
