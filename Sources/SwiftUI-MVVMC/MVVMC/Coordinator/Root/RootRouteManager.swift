//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine

final class RootRouteManager<
    RouteID: RootRouteID
>: RootRouteManagerProtocol {

    @Published 
    var currentRouteID: RouteID
    
    init(currentRouteID: RouteID) {
        self.currentRouteID = currentRouteID
    }
}
