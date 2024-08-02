//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationRootScreenCoordinating: NavigationDestinationCoordinating
where RouteID == NavigationScreenNavigationRouteID {}

final class NavigationRootScreenCoordinator: Coordinator, NavigationRootScreenCoordinating {
    
    let allowedRouteIDs: NavigationScreenAllowedNavigationRouteIDs = .init(
        values: .init(RouteID.allCases)
    )
}
