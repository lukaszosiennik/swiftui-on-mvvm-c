//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine
import SwiftUI

open class TransmittingRootCoordinator<
    RootRouteIDManager: RootRouteIDManageable
>: Coordinator, RootCoordinating, ObservedObjectChangeTransmitter {

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
