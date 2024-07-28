//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine
import SwiftUI

class RootCoordinator<
    RootRouteManagerType: RootRouteManagerProtocol
>: Coordinator, RootCoordinatorProtocol, ObservedObjectChangeTransmitterProtocol {

    @ObservedObject
    private(set) var routeManager: RootRouteManagerType
    
    var transmissionSubscription: AnyCancellable?
    
    init(
        parent: Coordinator?,
        routeManager: RootRouteManagerType
    ) {
        self.routeManager = routeManager
        super.init(parent: parent)
        
        initiateTransmission(for: routeManager)
    }
}
