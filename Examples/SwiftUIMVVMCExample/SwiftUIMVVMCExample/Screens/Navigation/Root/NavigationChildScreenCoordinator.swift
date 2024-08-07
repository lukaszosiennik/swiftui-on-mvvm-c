//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationChildScreenCoordinating: NavigationPathCoordinating
where RouteID == NavigationScreenNavigationRouteID {

    @discardableResult
    func goToRootRouteIDsScreen() -> Bool
}

final class NavigationChildScreenCoordinator: Coordinator, NavigationChildScreenCoordinating {

    let allowedRouteIDs: NavigationScreenAllowedNavigationRouteIDs = .init(
        values: .init(RouteID.allCases)
    )

    func goToRootRouteIDsScreen() -> Bool {
        goToRoot(routeID: AppRootRouteID.rootRouteIDs)
    }
}
