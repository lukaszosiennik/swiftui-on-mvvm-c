//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine
import SwiftUI

open class RootCoordinator<
    RootRouteIDManager: RootRouteIDManagerProtocol
>: Coordinator, RootCoordinatorProtocol, ObservedObjectChangeTransmitterProtocol {

    @ObservedObject
    public private(set) var routeIDManager: RootRouteIDManager
    
    var transmissionSubscription: AnyCancellable?
    
    public init(
        parent: Coordinator?,
        routeIDManager: RootRouteIDManager
    ) {
        self.routeIDManager = routeIDManager
        super.init(parent: parent)
        
        initiateTransmission(for: routeIDManager)
    }
}
