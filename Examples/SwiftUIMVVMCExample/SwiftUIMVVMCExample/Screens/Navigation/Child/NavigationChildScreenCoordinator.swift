//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationChildScreenCoordinatorProtocol: NavigationDestinationCoordinatorProtocol 
where RouteID == NavigationScreenNavigationRouteID {}

final class NavigationChildScreenCoordinator: Coordinator, NavigationChildScreenCoordinatorProtocol {
    
    let allowedRouteIDs: NavigationScreenAllowedNavigationRouteIDs = .init(
        values: .init([RouteID.second])
    )
}
