//
//  Created by Łukasz Osiennik on 22/06/2024.
//

import SwiftUI_MVVMC

protocol RootRouteIDsScreenCoordinating: Coordinating {
    
    @discardableResult
    func goToRoot(routeID: AppRootRouteID) -> Bool
}

final class RootRouteIDsScreenCoordinator: Coordinator, RootRouteIDsScreenCoordinating {}
