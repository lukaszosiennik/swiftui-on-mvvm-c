//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol LaunchScreenCoordinatorProtocol: CoordinatorProtocol {
    
    @discardableResult
    func goToHomeScreen() -> Bool
}

final class LaunchScreenCoordinator: Coordinator, LaunchScreenCoordinatorProtocol {
    
    func goToHomeScreen() -> Bool {
        goToRoot(routeID: AppRootRouteID.home)
    }
}
