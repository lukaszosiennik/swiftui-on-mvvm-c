//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine
import SwiftUI

open class RootCoordinator<
    RootRouteManager: RootRouteManagerProtocol
>: Coordinator, RootCoordinatorProtocol, ObservedObjectChangeTransmitterProtocol {

    @ObservedObject
    public private(set) var routeManager: RootRouteManager
    
    var transmissionSubscription: AnyCancellable?
    
    public init(
        parent: Coordinator?,
        routeManager: RootRouteManager
    ) {
        self.routeManager = routeManager
        super.init(parent: parent)
        
        initiateTransmission(for: routeManager)
    }
}
