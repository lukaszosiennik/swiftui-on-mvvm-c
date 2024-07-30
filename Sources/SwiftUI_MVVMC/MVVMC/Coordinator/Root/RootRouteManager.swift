//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine

public final class RootRouteManager<
    RouteID: RootRouteID
>: RootRouteManagerProtocol {

    @Published 
    public var currentRouteID: RouteID
    
    public init(currentRouteID: RouteID) {
        self.currentRouteID = currentRouteID
    }
}
